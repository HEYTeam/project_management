

import 'package:flutter/material.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key, required this.trailing, required this.avatar ,required this.title, this.space = 10, this.textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  ), this.verticalPadding = 5}) : super(key: key);
  final AvatarWidget avatar;
  final String title;
  final Widget? trailing;
  final double? space;
  final TextStyle? textStyle ;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            avatar,
            SizedBox(width: space),
            Flexible(child: Text(title,style: textStyle,overflow: TextOverflow.ellipsis,)),
            Spacer(),
            trailing!,
          ],
        ),
      ),
    );
  }
}