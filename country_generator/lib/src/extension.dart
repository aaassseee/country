import 'package:yaml/yaml.dart';

/// Extension class for converting yaml map to map
extension YamlMapToMapExtension on YamlMap {
  dynamic _convertNode(dynamic node) {
    if (node is YamlMap) {
      return node.toMap();
    }

    if (node is YamlList) {
      var list = <dynamic>[];
      for (final item in node) {
        list.add(_convertNode(item));
      }
      return list;
    }

    if (node is YamlScalar) {
      return node.value;
    }

    return node;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    nodes.forEach((k, v) {
      final key = (k is YamlScalar) ? k.value.toString() : k.toString();
      map[key] = _convertNode(v);
    });
    return map;
  }
}
