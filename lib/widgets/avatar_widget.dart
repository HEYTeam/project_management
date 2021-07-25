

import 'dart:ui';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, this.image, this.backgroundColor, this.radius, this.child = null}) : super(key: key);
  final String? image;
  final Color? backgroundColor;
  final double? radius;
  final Widget?  child;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      backgroundImage: image != null ?  AssetImage(image!): null,
      child: child,
    );
  }
}