
import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/logic/data.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/modules/task/widgets/card_item_project.dart';
import '../../../logic/data.dart';
class DasboardPage extends StatelessWidget {
  const DasboardPage({Key? key, required this.projectList}) : super(key: key);
  final List<Project> projectList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            final height = size.maxHeight;
            final width = size.maxWidth;
            return SingleChildScrollView(
              child: Container(
                height: height,
                child:Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(height: height * 0.2,child: AspectRatio(aspectRatio: 1,child: CircularProgressIndicator(strokeWidth: 30,color: Colors.grey,value: 1,))),
                            Container(height: height * 0.2,child: AspectRatio(aspectRatio: 1,child: CircularProgressIndicator(strokeWidth: 30,color: kColorsOrange,value: 0.8,))),
                            Container(height: height * 0.2,child: AspectRatio(aspectRatio: 1,child: CircularProgressIndicator(strokeWidth: 30,color: kColorsGreen,value: 0.5,))),
                            DefaultTextStyle(
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("90"),
                                  Text("Total")
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              indicate(height,width,"To do", kColorsGreen),
                              indicate(height,width,"To do", kColorsOrange),
                              indicate(height,width,"To do",kColorsGrey),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.05,),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: projectList.length,
                        itemBuilder: (context, index) {
                          return CardItemProject(height: height,project: projectList[index],width: width);
                        },
                      ),
                    )
                  ],
                )
              ),
            );
          },
        ),
      ),
    );
  }

  Row indicate(double height, double width,String note, Color? color){
    return Row(
      children: [
        Container(
          height: 20, 
          width: 20,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(100))
          ),
        SizedBox(width: 20),
        Text("Todo 24%")
      ],
    );
  }
}

