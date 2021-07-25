







import 'dart:ui';

import 'package:manager_app/models/label.dart';
import 'package:manager_app/models/message.dart';
import 'package:manager_app/models/notification.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/models/user.dart';
import 'package:manager_app/models/label.dart' as LB;




User user1 = new User(id:"01",name: "Nguyễn Văn Toán",image:"assets/images/avatar1.jpg");
User user2 = new User(id:"02",name: "Hoàng Hữu Nhanh",image:"assets/images/avatar2.jpg");
User user3 = new User(id:"03",name: "Lê Hữu Nghĩa",image:"assets/images/avatar4.jpg");
User user4 = new User(id:"04",name: "Đình Chương",image:"assets/images/avatar4.jpg");
User user5 = new User(id:"05",name: "Thanh Hải",image:"assets/images/avatar2.jpg");

LB.Label label1 = new LB.Label(id:"01",name: "Done",color:Color(0xFF6CEE90));
LB.Label label2 = new LB.Label(id:"02",name: "Testing",color:Color(0xFF6F6CEE));
LB.Label label3 = new LB.Label(id:"03",name: "Await",color:Color(0xFFC4C4C4));
LB.Label label4 = new LB.Label(id:"04",name: "In Progress",color:Color(0xFFFD2B0F));
LB.Label label5 = new LB.Label(id:"05",name: "Pending",color:Color(0xFFB6897B));
LB.Label label6 = new LB.Label(id:"06",name: "Doing",color:Color(0xFFFD8F0F));

Notification noti1 = new Notification(id: "01",message: "commented on one of the projects",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Comment.toString(),timeAgo:DateTime.now(),isWatched: false);
Notification noti2 = new Notification(id: "02",message: "changed the label as to do in the Shop App",uid: '02',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Label.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti3 = new Notification(id: "03",message: "completed the task in the Shop app",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Task.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti4 = new Notification(id: "04",message: "changed the label as to do in the Shop App",uid: '03',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Label.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti5 = new Notification(id: "05",message: "completed the task in the Shop app",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Comment.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti6 = new Notification(id: "06",message: "changed the label as to do in the Shop App",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Label.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti7 = new Notification(id: "07",message: "completed the task in the Shop app",uid: '02',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Task.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti8 = new Notification(id: "08",message: "changed the label as to do in the Shop App",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Label.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti9 = new Notification(id: "09",message: "completed the task in the Shop app",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Task.toString(),timeAgo:DateTime.now(), isWatched: true);
Notification noti10 = new Notification(id: "10",message: "commented on one of the projects",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Comment.toString(), timeAgo:DateTime.now(), isWatched: true);
Notification noti11 = new Notification(id: "11",message: "changed the label as to do in the Shop App",uid: '01',idPro: '01',idTask: 'task1',modelNotification: ModelNotification.Label.toString(), timeAgo:DateTime.now(), isWatched: true);
Notification noti12 = new Notification(id: "12",message: "changed the label as to do in the Shop App",uid: '05',idPro: '09',idTask: 'task1',modelNotification: ModelNotification.Comment.toString(), timeAgo:DateTime.now(), isWatched: true);


Message ms1 = new Message(uid: "01",userName: "Nguyễn Văn Toán",date: DateTime.now(),message: "The Flutter library for calling the API of Bitkub.com such as viewing prices and trading in cryptocurrency.",idProfile: "01");
Message ms2 = new Message(uid: "02",userName: "Hoàng Hữu Nhanh",date: DateTime.now(),message: "The Flutter library for calling the API of Bitkub.com such as viewing prices and trading in cryptocurrency.",idProfile: "02");
Message ms3 = new Message(uid: "03",userName: "Lê Huữ Nghĩa",date: DateTime.now(),message: "The Flutter library for calling the API of Bitkub.com such as viewing prices and trading in cryptocurrency.",idProfile: "02");
Message ms4 = new Message(uid: "01",userName: "Nguyễn Văn Toán",date: DateTime.now(),message: "The Flutter library for calling the API of Bitkub.com such as viewing prices and trading in cryptocurrency.",idProfile: "01");
Message ms5 = new Message(uid: "05",userName: "Thanh Hải",date: DateTime.now(),message: "The Flutter library for calling the API of Bitkub.com such as viewing prices and trading in cryptocurrency.",idProfile: "01");


Task task1 = new Task(name: "Design UI",description: "Design UI login",isState: false,startDate: DateTime.now(),endDate: DateTime.now().add(Duration(days: 2)),messages: [ms1, ms2, ms3],member: [user1,user3],label: label2);
Task task2 = new Task(name: "Design UI",description: "Design UI login",isState: false,startDate: DateTime.now(),endDate: DateTime.now().add(Duration(days: 2)),messages: [ms4,ms2, ms3],member: [user1,user5],label: label1);
Task task3 = new Task(name: "Design UI",description: "Design UI login",isState: false,startDate: DateTime.now(),endDate: DateTime.now().add(Duration(days: 2)),messages: [ms5,ms2,ms4],member: [user1,user2],label: label4);
Task task4 = new Task(name: "Design UI",description: "Design UI login",isState: false,startDate: DateTime.now(),endDate: DateTime.now().add(Duration(days: 2)),messages: [ms3,ms2,ms4],member: [user1,user5],label: label5);
Task task5 = new Task(name: "Design UI",description: "Design UI login",isState: false,startDate: DateTime.now(),endDate: DateTime.now().add(Duration(days: 2)),messages: [ms3,ms5,ms2],member: [user5],label: label6);

List<Project> PROJECT = [
  Project(id: "01",name: "Shop App",tasks: [task2,task1,task3],member: [user1,user2,user3,user4,user5], messages:[ms1, ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "02",name: "Note App",tasks: [task1,task2,task3],member: [user1,user2,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "03",name: "Travel App",tasks: [task1,task5,task3],member: [user1,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "04",name: "English App",tasks: [task1,task3,task3],member: [user1,user2,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "05",name: "Weather App",tasks: [task1,task2,task3],member: [user1,user2,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "06",name: "Game App",tasks: [task1,task4,task5],member: [user1,user2,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "07",name: "Math App",tasks: [task1,task4,task3],member: [user1,user2,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
  Project(id: "08",name: "Pokemon App",tasks: [task1,task5,task3],member: [user1,user2,user3,user4,user5],messages: [ms4,ms2, ms3],labels:[label1,label2,label3,label4,label5,label6]),
];


List<Notification> notifications = [
  noti1,
  noti2,
  noti3,
  noti4,
  noti5,
  noti6,
  noti7,
  noti8,
  noti9,
  noti10,
  noti11,
  noti12,

];