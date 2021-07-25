


import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

class NotificationTypeWidget extends StatelessWidget {
  const NotificationTypeWidget({Key? key, this.icon, this.image, this.radius = 25, this.backgroundColor = Colors.white}) : super(key: key);
  final String? image;
  final Widget? icon;
  final double? radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AvatarWidget(
          radius: radius,
          backgroundColor: kColorsAmber200,
          image: image,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            AvatarWidget(
              radius: 15,
              backgroundColor: backgroundColor,
            ),
            icon!
          ],
        )
      ],
    );
  }
}