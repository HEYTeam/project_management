



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:manager_app/widgets/pie_chart_value_widget.dart';

class PieChart extends StatelessWidget {
  const PieChart({Key? key, required this.height, required this.pieChartValues}) : super(key: key);
  final double height;
  final List<PieChartValueWidget> pieChartValues;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Container(
        child:Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration:BoxDecoration(
                  color:Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.white,blurRadius: 10,spreadRadius: 1)]
                  ),
                  child: Center(child: Text("100%",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),),),
                ),
              )
            ),
            ...pieChartValues
          ],
        ),
      ),
    );
  }
}