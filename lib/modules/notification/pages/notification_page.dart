

import 'package:flutter/material.dart';
import 'package:manager_app/models/notification.dart' as NT;
import 'package:manager_app/models/project.dart';
import 'package:manager_app/modules/notification/widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key, required this.notifications, required this.projects}) : super(key: key);
  final List<NT.Notification> notifications;
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Container(
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationWidget(notification: notifications[index],projectList: projects,);
            },
          ),
        );
      },
    );
  }
}