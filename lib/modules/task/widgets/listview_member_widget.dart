

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

import 'list_tile_widget.dart';

class ListViewMemberWidget extends StatefulWidget {
  const ListViewMemberWidget({Key? key, required this.project, this.trailing, required this.height, required this.task}) : super(key: key);
  final Project project;
  final Widget? trailing;
  final double height;
  final Task task;

  @override
  _ListViewMemberWidgetState createState() => _ListViewMemberWidgetState();
}

class _ListViewMemberWidgetState extends State<ListViewMemberWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.project.member.length,
        itemBuilder: (context, index) {
          return ListTileWidget(
            trailing: widget.task.member.where((task) => task.id == widget.project.member[index].id).length != 0 ? widget.trailing : Text(""),
            avatar: AvatarWidget(
              radius: 20,
            ), 
            title: widget.project.member[index].name);
        },
      )
    );
  }
}