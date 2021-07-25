import 'dart:convert';

class Message {
  final String userName;
  final String message;
  final DateTime date;
  final String uid;
  final String idProfile;
  
  Message({
    required this.userName,
    required this.message,
    required this.date,
    required this.uid,
    required this.idProfile,
  });
  
  

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'message': message,
      'date': date.millisecondsSinceEpoch,
      'uid': uid,
      'idProfile': idProfile,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      userName: map['userName'],
      message: map['message'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      uid: map['uid'],
      idProfile: map['idProfile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));
}
