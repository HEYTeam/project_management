



import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

import 'list_tile_widget.dart';

class ListViewLabelWidget extends StatelessWidget {
  const ListViewLabelWidget({Key? key,required this.task ,required this.project, this.trailing, required this.height}) : super(key: key);
  final Project project;
  final Widget? trailing;
  final Task task;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: project.member.length,
        itemBuilder: (context, index) {
          return ListTileWidget(
            trailing: task.label!.name == project.labels[index].name ? trailing! : Text(""), 
            avatar: AvatarWidget(
              backgroundColor: kColorsGrey.withOpacity(0.6),
              radius: 20,
              child: Icon(Icons.label,color: project.labels[index].color,),), 
              title: project.labels[index].name,);
        },
      )
    );
  }
}