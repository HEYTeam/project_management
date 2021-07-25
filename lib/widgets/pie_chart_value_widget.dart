

import 'package:flutter/material.dart';

class PieChartValueWidget extends StatelessWidget {
  const PieChartValueWidget({Key? key, required this.value, this.color = Colors.grey, this.aspectRatio = 1}) : assert(value <= 1),super(key: key);
  final double value;
  final Color? color;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio??1,
        child: CircularProgressIndicator(value:value,strokeWidth: 10,color: color,)
    );
  }
}