import 'dart:convert';

enum ModelNotification {
  Comment, Label, Task
}

class Notification {
  final String id;
  final String message;
  final String modelNotification;
  final String uid;
  final String idPro;
  final String idTask;
  final DateTime timeAgo;
  bool isWatched = false;

  Notification({
    required this.id,
    required this.message,
    required this.modelNotification,
    required this.uid,
    required this.idPro,
    required this.idTask,
    required this.timeAgo,
    required this.isWatched
  });

 



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'modelNotification': modelNotification,
      'uid': uid,
      'idPro': idPro,
      'idTask': idTask,
      'timeAgo': timeAgo,
      'isWatched': isWatched
    };
  }


  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'],
      message: map['message'],
      modelNotification: map['modelNotification'],
      uid: map['uid'],
      idPro: map['idPro'],
      idTask: map['idTask'],
      timeAgo: map['toMap'],
      isWatched: map['isWatched']
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));
}
