import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/modules/task/widgets/listview_color_widget.dart';
import 'package:manager_app/modules/task/widgets/listview_label_widget.dart';
import 'package:manager_app/modules/task/widgets/listview_member_widget.dart';
import 'package:manager_app/modules/task/widgets/message_widget.dart';
import 'package:manager_app/widgets/dialog_widget.dart';
import 'package:manager_app/widgets/menu_item_widget.dart';
import 'package:manager_app/widgets/team_widget.dart';


enum Model {
  Label,Member
}

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({Key? key, required this.task, required this.project}) : super(key: key);
  final Task task;
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.name),
        centerTitle: true,
        actions: [
          Checkbox(value: false, onChanged: (value){
            
          })
        ],
      ),
      body: LayoutBuilder(
        builder: (context, size) {
          final width = size.maxWidth;
          final height = size.maxHeight;
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: height * 0.1, right: 10, left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TeamWidget(width: width,team: task.member,left: 1),
                        GestureDetector(
                          onTap: ()=> showDialog(context,Model.Member),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFC4C4C4),
                            radius: 20,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap:()=> showDialog(context,Model.Label),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.label, color: task.label!.color,),
                          Text(task.label!.name)
                        ],
                      ),
                    )
                  ],
                ),//
                SizedBox(height: height * 0.02),
                MenuItem(icon: Icons.timer,space: width *0.03,title: "${DateFormat.yMMMMd().format(task.startDate)} - ${DateFormat.yMMMMd().format(task.endDate)}",),
                SizedBox(height: height * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuItem(icon: Icons.list_outlined,space: width * 0.02,title: "Description",),
                    SizedBox(height: height * 0.01),
                    Text(task.description, maxLines: 7,)
                  ],
                ),
                SizedBox(height: height * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(icon: Icons.comment,space: width * 0.02,title: "Comments",),
                      SizedBox(height: height * 0.04),
                      Expanded(
                        child: ListView.builder(
                          itemCount: task.messages.length,
                          itemBuilder: (context, index) {
                            return MessageWidget(message: task.messages[index],uid: "01",);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  showDialog(BuildContext context, Model model){
    DialogWidget(
    context,
    titleDialog: Model.Label == model ? "Label" : "Member",
    actions: [
      if(Model.Label == model)
      CupertinoDialogAction(
        child: Text("Add Label"),
        onPressed: (){
          DialogWidget(context,
            content:ListViewColorWidget(height: 200,),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text("Cancel"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
            titleDialog: "Color"
          ).showCupertinoDialog();
        },
      ),
      CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      CupertinoDialogAction(
        child: Text("Cancel"),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    ],
    content: Model.Label != model ? ListViewMemberWidget(
      task: task,
      height: 200,
      project: project,
      trailing: Icon(Icons.check)) : ListViewLabelWidget(height: 200,project: project,trailing: Icon(Icons.check),task: task)
      ).showCupertinoDialog();
  }

}






