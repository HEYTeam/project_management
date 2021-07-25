

import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/modules/task/widgets/chart_widget.dart';
import 'package:manager_app/modules/task/widgets/message_widget.dart';
import 'package:manager_app/modules/task/widgets/task_widget.dart';

class ProjectDetailPage extends StatefulWidget {
  ProjectDetailPage({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  static bool isMessage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SafeArea(
         child: LayoutBuilder(
           builder: (context, size) {
             final width = size.maxWidth;
             final height = size.maxHeight;
             return Container(
              height: size.maxHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.maxHeight * 0.03),
                          child: Text(widget.project.name, style: TextStyle(fontWeight: FontWeight.bold, color: kColorsGrey, fontSize: 40),),
                        ),
                        Text("12 Jun - 15 Jun"),
                        SizedBox(height: height * 0.01,),
                        members(),
                        //
                        SizedBox(height: height * 0.02,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ChartWidget(height: height,pieChartNotePadding: width * 0.06),
                            Spacer(),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                IconButton(icon: Icon(isMessage ? Icons.list_outlined : Icons.message, size: 40,color: Color(0xFF6F6CEE),),onPressed: (){
                                  setState(() {
                                    isMessage = !isMessage;
                                  });
                                },),
                                Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.green
                                  ),
                                  child: Text(isMessage ? widget.project.messages.length.toString() : widget.project.tasks.length.toString(),
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.05,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: isMessage ? widget.project.messages.length : widget.project.tasks.length,
                        itemBuilder: (context, index) {
                          Task task = widget.project.tasks[index];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: isMessage ? MessageWidget(message: widget.project.messages[index],uid: "01",) : GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,'/task_detail_page',arguments: {'task':task, 'project':widget.project});
                              },
                            child: TaskWidget(task: task, height: height * 0.1)),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
           },
         )
       )
    );
  }


  Widget members(){
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.project.member.map((e) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.orange
            ),
        ),
        ).toList()
      ),
    );
  }
}
