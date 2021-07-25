

import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/notification.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/notification.dart' as NT;
import 'package:timeago/timeago.dart' as timeago;
import 'notification_type_widget.dart';


class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key, this.height = 100,  this.projectList, required this.notification}) : super(key: key);
  final double? height;
  final List<Project>? projectList;
  final NT.Notification notification;
  @override
  Widget build(BuildContext context) {
    final Project? project = projectList!.firstWhereOrNull((element) => element.id == notification.idPro);
    final user = project?.member.firstWhereOrNull((member) => member.id == notification.uid);

    return project == null ? SizedBox(width: 0,height: 0,):Container(
      color: notification.isWatched ? Colors.white : kColorsBlue100,
      height: height,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationTypeWidget(
            image: user!.image,
            icon: iconNotification(notification.modelNotification),
            radius: 38,
            backgroundColor: iconNotificationBackground(notification.modelNotification)
          ),
          SizedBox(width: 10,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height:0.5),
                Flexible(
                  child: RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: user.name +" ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:Colors.black)
                        ),
                        TextSpan(
                            text: notification.message,
                            style: TextStyle(fontSize: 16,color:Colors.black,
                          )
                        ),
                      ]
                    ),
                  ),
                ),
                Text(timeago.format(notification.timeAgo),style: TextStyle(fontSize: 16,color:Colors.black)),
                SizedBox(height:0.5),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget iconNotification(String modelNotification){
    if(modelNotification == ModelNotification.Comment.toString()){
      return Icon(Icons.comment, size: 18,color: Colors.white,);
    }else if(modelNotification == ModelNotification.Label.toString()){
      return Icon(Icons.label, size: 18,color: Colors.white);
    }else if(modelNotification == ModelNotification.Task.toString()){
      return Icon(Icons.check, size: 18,color: Colors.white);
    }
    return Icon(Icons.notifications);
  }

  Color iconNotificationBackground(String modelNotification){
    if(modelNotification == ModelNotification.Comment.toString()){
      return kColorsGreen;
    }else if(modelNotification == ModelNotification.Label.toString()){
      return kColorsIndigo500;
    }else {
      return kColorsBlue;
    }
  }

}

extension MyIterable<T> on Iterable<T> {
  //T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}