

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manager_app/models/label.dart' as LB;
import 'package:manager_app/models/message.dart';
import 'package:manager_app/models/user.dart';

class Task {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final List<Message> messages;
  final List<User> member;
  LB.Label? label = LB.Label(id: "00", name: "Nothing", color: Colors.black);
  bool isState = false;
  Task({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.messages,
    required this.member,
    this.label,
    required this.isState,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'description': description,
      'messages': messages.map((x) => x.toMap()).toList(),
      'member': member.map((x) => x.toMap()).toList(),
      'label': label!.toMap(),
      'isState': isState,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      description: map['description'],
      messages: List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      member: List<User>.from(map['member']?.map((x) => User.fromMap(x))),
      label: LB.Label.fromMap(map['label']),
      isState: map['isState'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
