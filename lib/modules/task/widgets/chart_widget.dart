

import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/widgets/pie_chart.dart';
import 'package:manager_app/widgets/pie_chart_note.dart';
import 'package:manager_app/widgets/pie_chart_value_widget.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key, required this.height, this.pieChartNotePadding = 10}) : super(key: key);
  final double height;
  final double? pieChartNotePadding;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PieChart(height: height * 0.1,pieChartValues: [
          PieChartValueWidget(value: 1,),
          PieChartValueWidget(value: 0.2,color: Colors.green,),
        ],),
        //2
        SizedBox(width: pieChartNotePadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01,),
            PieChartNote(note: "Complete",color: kColorsGreen),
            SizedBox(height: height * 0.01,),
            PieChartNote(note: "To do", color: kColorsGrey)
          ],
        ),//3
      ],
    );
  }
}