#!/usr/bin/env python3
"""Generate Mermaid class diagrams of the document context from dsw-models.

The graph module is only parsed, never imported or executed:

    python3 maintenance/generate_document_context_diagrams.py \
        ../engine-tools/packages/dsw-models/dsw/models/document_context/graph.py

A class missing from GROUPS and EXCLUDED fails the script, so a new entity cannot be
left out unnoticed. See README.md for rendering the sources to SVG.
"""
import argparse
import ast
import pathlib
import re

OUTPUT_DIR = (pathlib.Path(__file__).parent.parent
              / 'docs/more/development/document-templates/document-context')

GROUPS = {
    'context': [
        'DocumentContext', 'ContextConfig', 'Color', 'Workspace', 'Document',
        'DocumentDocumentTemplate', 'DocumentFormat', 'DocumentTemplateLocale',
        'KnowledgeModelPackage', 'Project', 'KnowledgeModelEditor', 'Questionnaire',
        'ProjectVersion', 'ProjectFile', 'User', 'UserGroup', 'UserGroupMember',
        'DocumentContextUserPermission', 'DocumentContextUserGroupPermission',
        'SimpleAuthor', 'Report', 'ReportItem', 'ReportIndication', 'ReportMetric',
    ],
    'knowledge-model': [
        'KnowledgeModel', 'KnowledgeModelEntities', 'Chapter', 'Expert', 'Reference',
        'CrossReference', 'URLReference', 'ResourcePageReference', 'ResourceCollection',
        'ResourcePage', 'Metric', 'Phase', 'Integration', 'ApiIntegration', 'PluginIntegration',
        'Tag',
    ],
    'questions': [
        'Question', 'ValueQuestion', 'ValueQuestionValidation', 'OptionsQuestion',
        'MultiChoiceQuestion', 'ListQuestion', 'IntegrationQuestion', 'ItemSelectQuestion',
        'FileQuestion', 'Answer', 'MetricMeasure', 'Choice',
    ],
    'replies': [
        'RepliesContainer', 'Reply', 'AnswerReply', 'StringReply', 'ItemListReply',
        'MultiChoiceReply', 'IntegrationReply', 'ItemSelectReply', 'FileReply',
    ],
}
EXCLUDED = {'ReplyVisitor'}
# Names used on the guide page where they differ from the classes
DISPLAY_NAMES = {
    'DocumentContextUserPermission': 'UserPermission',
    'DocumentContextUserGroupPermission': 'UserGroupPermission',
}
# Attributes without a usable annotation in the module
TYPE_OVERRIDES = {
    ('ItemSelectQuestion', 'list_question'): 'ListQuestion | None',
    ('FileQuestion', 'max_size'): 'int | None',
    ('FileQuestion', 'file_types'): 'str | None',
    ('ValueQuestionValidation', 'type'): 'str',
    # Loaded with an empty string instead of None
    ('Project', 'description'): 'str',
    ('ProjectVersion', 'description'): 'str',
}
# Shortcuts and rendering internals that the guide page does not describe
HIDDEN_PROPERTIES = {
    'a', 'e', 'has_direct_item_title', 'item_title',
    'cross_references', 'resource_page_references', 'url_references',
}
# Holds every entity by UUID, so arrows would only repeat the rest of the diagram
NO_ARROWS = {'KnowledgeModelEntities'}


def annotation_of(value, params, classes):
    if isinstance(value, ast.Name) and value.id in params:
        return params[value.id]
    if isinstance(value, ast.Call):
        func = value.func
        if isinstance(func, ast.Attribute) and isinstance(func.value, ast.Name) \
                and func.value.id in params:
            return params[func.value.id]
        if isinstance(func, ast.Name) and func.id in classes:
            return func.id
        if isinstance(func, ast.Attribute) and isinstance(func.value, ast.Name) \
                and func.value.id in classes:
            return func.value.id
        if isinstance(func, ast.Name) and func.id == '_load_optional':
            return f'{value.args[0].id} | None'
    return None


def parse_class(node, classes):
    bases = [b.id for b in node.bases if isinstance(b, ast.Name) and b.id in classes]
    init = next((n for n in node.body
                 if isinstance(n, ast.FunctionDef) and n.name == '__init__'), None)
    attrs = {}
    for stmt in node.body:
        if isinstance(stmt, ast.FunctionDef) and not stmt.name.startswith('_') \
                and any(isinstance(d, ast.Name) and d.id == 'property' for d in stmt.decorator_list) \
                and (stmt.name not in HIDDEN_PROPERTIES or (node.name, stmt.name) == ('ItemSelectReply', 'item_title')):
            attrs[stmt.name] = ast.unparse(stmt.returns) if stmt.returns else None
    if init is None:
        return bases, attrs
    args = init.args.args + init.args.kwonlyargs
    params = {a.arg: ast.unparse(a.annotation) for a in args if a.annotation is not None}
    for stmt in ast.walk(init):
        if isinstance(stmt, ast.AnnAssign):
            targets, annotation = [stmt.target], ast.unparse(stmt.annotation)
        elif isinstance(stmt, ast.Assign):
            target = stmt.targets[0]
            targets = target.elts if isinstance(target, ast.Tuple) else [target]
            annotation = annotation_of(stmt.value, params, classes)
        else:
            continue
        for target in targets:
            if isinstance(target, ast.Attribute) and isinstance(target.value, ast.Name) \
                    and target.value.id == 'self' and not target.attr.startswith('_'):
                attrs[target.attr] = attrs.get(target.attr) or annotation
    return bases, attrs


def visible_attrs(name, attrs):
    # Raw UUID links are hidden where the attribute with the resolved entity exists
    result = {}
    for attr, annotation in attrs.items():
        match = re.fullmatch(r'(.+)_uuids?', attr)
        if match and (match[1] in attrs or f'{match[1]}s' in attrs):
            continue
        result[attr] = TYPE_OVERRIDES.get((name, attr), annotation)
    return result


def show_type(annotation):
    if annotation is None:
        return ''
    annotation = annotation.replace('AnnotationsT', 'dict[str, str]').replace('typing.', '')
    match = re.fullmatch(r'(.+) \| None', annotation)
    return f'Optional[{match[1]}]' if match else annotation


def linked_classes(annotation, classes):
    """Return the linked classes and their multiplicity."""
    found = [c for c in re.findall(r'\w+', annotation or '') if c in classes]
    if annotation is not None and annotation.startswith(('list[', 'dict[')):
        return found, '*'
    return found, '0..1' if 'None' in (annotation or '') else '1'


def render(members, parsed):
    def display(name):
        return DISPLAY_NAMES.get(name, name)

    classes = set(parsed)
    lines, relations, stubs = ['classDiagram', '    direction LR'], [], []
    for name in members:
        bases, attrs = parsed[name]
        lines.append(f'    class {display(name)} {{')
        for attr, annotation in visible_attrs(name, attrs).items():
            targets, multiplicity = linked_classes(annotation, classes)
            if not targets or name in NO_ARROWS:
                type_ = show_type(annotation)
                lines.append(f'        {attr}: {type_}' if type_ else f'        {attr}')
                continue
            for target in targets:
                relations.append(
                    f'    {display(name)} --> "{multiplicity}" {display(target)} : {attr}')
                if target not in members and target not in stubs:
                    stubs.append(target)
        lines.append('    }')
        for base in bases:
            relations.append(f'    {display(base)} <|-- {display(name)}')
    lines.extend(f'    class {display(stub)}' for stub in stubs)
    return '\n'.join(lines + relations) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument('graph', type=pathlib.Path, help='path to document_context/graph.py')
    parser.add_argument('--output', type=pathlib.Path, default=OUTPUT_DIR)
    args = parser.parse_args()

    tree = ast.parse(args.graph.read_text(encoding='utf-8'))
    nodes = [n for n in tree.body if isinstance(n, ast.ClassDef)]
    classes = {n.name for n in nodes}
    grouped = {name for members in GROUPS.values() for name in members}
    unknown = classes - grouped - EXCLUDED
    stale = grouped - classes
    if unknown or stale:
        raise SystemExit(f'Update GROUPS: new {sorted(unknown)}, removed {sorted(stale)}')

    parsed = {n.name: parse_class(n, classes) for n in nodes}
    args.output.mkdir(parents=True, exist_ok=True)
    for group, members in GROUPS.items():
        path = args.output / f'{group}.mmd'
        path.write_text(render(members, parsed), encoding='utf-8')
        print(path)


if __name__ == '__main__':
    main()
