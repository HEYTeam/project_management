

import 'package:flutter/material.dart';
import 'package:manager_app/models/user.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({Key? key,required this.team,required this.width, this.right = null , this.top = null , this.bottom = null, this.left = null}) : super(key: key);
  final List<User> team;
  final double width;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  @override
  Widget build(BuildContext context) {
    double space = width * 0.009 * -1;
    return Container(
      height: 40,
      width: ((width * (0.1 * team.length)).toInt()) * 1.0,
      child: Stack(
        alignment: Alignment.topLeft,
        children: team.map((member)=> 
          Positioned(
            left: left != null ? (space + (space += (width * 0.03)* left!)) * left! : null,
            right:right != null ? (space + (space += (width * 0.03) * right!)) * right! : null,
            top: top != null ? (space + (space += (width * 0.03)* top!)) * top! : null,
            bottom: bottom != null ? (space + (space += (width * 0.03)* bottom!)) * bottom! : null,
            child: AvatarWidget(radius: 20, backgroundColor: Colors.orange,image: member.image,)
          )
        ).toList()
      ),
    );
  }
}


// class TeamStackWidget extends StatelessWidget {
//   const TeamStackWidget({Key? key,required this.team,required this.width, this.right = 0.0}) : super(key: key);
//   final List<User> team;
//   final double width;
//   final double? right;
//   @override
//   Widget build(BuildContext context) {
//     double space = width * 0.009;
//     return Stack(
//       children: team.map((member)=> 
//         Positioned(
//           right: (space + (space += (width * 0.03) * right!)) * right!,
//           child: AvatarWidget(radius: 20, backgroundColor: Colors.orange,image: member.image,)
//         )
//       ).toList()
//     );
//   }
// }