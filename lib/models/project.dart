

import 'dart:convert';

import 'package:manager_app/models/label.dart' as LB;
import 'package:manager_app/models/message.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/models/user.dart';

class Project {
  final String id;
  final String name;
  final List<Task> tasks;
  final List<Message> messages;
  final List<User> member;
  final List<LB.Label> labels;
  Project({
    required this.id,
    required this.name,
    required this.tasks,
    required this.messages,
    required this.member,
    required this.labels,
  });
  
  
  

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((x) => x.toMap()).toList(),
      'messages': messages.map((x) => x.toMap()).toList(),
      'member': member.map((x) => x.toMap()).toList(),
      'labels': labels.map((x) => x.toMap()).toList(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))),
      messages: List<Message>.from(map['messages']?.map((x) => Message.fromMap(x))),
      member: List<User>.from(map['member']?.map((x) => User.fromMap(x))),
      labels: List<LB.Label>.from(map['labels']?.map((x) => LB.Label.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source));
}
