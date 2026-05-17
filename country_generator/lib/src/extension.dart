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

    return node;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}
