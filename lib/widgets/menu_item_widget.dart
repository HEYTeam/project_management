


import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
    {
      Key? key, 
      required this.space, 
      required this.icon, 
      required this.title, 
      this.trailing, this.iconSize = 25,
      this.iconColor = kColorsBlue,
      this.style = const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    }) : super(key: key);
  final double space;
  final String title;
  final IconData icon;
  final Widget? trailing;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize,color: iconColor,),
        SizedBox(width: space),
        Text(title, style: style!,overflow: TextOverflow.ellipsis,),
        if(trailing != null)
        Spacer(),
        if(trailing != null)
        trailing!,
      ],
    );
  }
}