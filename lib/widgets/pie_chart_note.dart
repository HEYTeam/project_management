

import 'package:flutter/material.dart';

class PieChartNote extends StatelessWidget {
  const PieChartNote({Key? key, required this.note, this.color}) : super(key: key);
  final String note;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 20,
            width: 20,
            color:color
          ),
        ),
        SizedBox(width: 10,),
        Text(note)
      ],
    );
  }
}