

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget {
  const DialogWidget(this.context,{this.titleDialog = "", this.actions = const [], required this.content});
  final BuildContext context;
  final String? titleDialog;
  final List<CupertinoDialogAction>? actions;
  final Widget content;
  showCupertinoDialog(){
      // showCupertinoDialog(context: context, builder: (context) { // Kích ở ngoài k dismissible
      //   return CupertinoAlertDialog(
      //     title: Text("ok"),
      //       actions: [
      //         CupertinoDialogAction(
      //           child: Text("ok"),
      //           isDefaultAction: true,
      //         ),
      //         CupertinoDialogAction(
      //           child: Text("cancel"),
      //         )
      //       ],);
      // },);
    showCupertinoModalPopup(
      context: context, builder: (context) {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              Text(titleDialog!),
              Divider()
            ],
          ),
          content: content,
          actions: actions!,
        );
      },
    );
  }
}

