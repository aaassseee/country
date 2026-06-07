import 'package:country_generator/src/extension.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  test('YamlMap.toMap preserves nested map keys', () {
    final yaml = '''
root:
  translations:
    en:
      hello: "Hello"
    es:
      hello: "Hola"
''';
    final doc = loadYaml(yaml) as YamlMap;
    final map = (doc['root'] as YamlMap).toMap();
    expect(map['translations'], isA<Map>());
    final translations = map['translations'] as Map;
    expect(translations['en'], isA<Map>());
    expect(translations['es'], isA<Map>());
    expect(translations['en']['hello'], 'Hello');
    expect(translations['es']['hello'], 'Hola');
  });
}
