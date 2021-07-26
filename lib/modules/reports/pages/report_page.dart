


import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/modules/reports/widgets/line_chart_widget.dart';
import 'package:manager_app/modules/reports/widgets/bar_chart_widget.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Task Overview", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              IconButton(onPressed: (){}, icon: Icon(Icons.calendar_today))
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    task(context, task: 10, title: "Completes"),
                    SizedBox(width: 20,),
                    task(context, task: 20, title: "Doing task", color: kColorsGrey)
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BarChartWidget(),
                        SizedBox(height:20),
                        LineChartWidget(),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget task(BuildContext context, {required int task,Color? color = kColorsBlue, String? title = ""}){
    return Expanded(
      flex: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:color
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${task}",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
            Text(title!,style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18))
          ],
        ),
      ),
    );
  }
}