import 'dart:convert';

import 'dart:ui';



class Label {
  final String id;
  final String name;
  final Color color;
  Label({
    required this.id,
    required this.name,
    required this.color,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.value,
    };
  }

  factory Label.fromMap(Map<String, dynamic> map) {
    return Label(
      id: map['id'],
      name: map['name'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Label.fromJson(String source) => Label.fromMap(json.decode(source));
}
