import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/widgets/avatar_widget.dart';
import 'package:manager_app/widgets/team_widget.dart';


class CardItemProject extends StatelessWidget {
  const CardItemProject({Key? key, required this.height, required this.project, required this.width}) : super(key: key);
  final double height;
  final Project project;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/project_detail',arguments: project);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width:2,color:Colors.green),
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          height: height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: Text(project.name[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
                  ),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.name,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Task done ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
                              TextSpan(text: "${project.tasks.where((task) => task.isState == true).toList().length}",style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green)),
                              TextSpan(text: "/${project.tasks.length}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
                            ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              
              SizedBox(height: height * 0.01,),
              Stack(
                children: [
                  LinearProgressIndicator(minHeight: 5,value: 1,color: kColorsGrey,),
                  LinearProgressIndicator(minHeight: 5,value: 0.2,color:kColorsGreen,),
                ],
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TeamWidget(team: project.member, width: width,right: 1,bottom: 0,),
                    )
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  

}