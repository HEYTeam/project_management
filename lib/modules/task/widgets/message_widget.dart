


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/message.dart';
import 'package:manager_app/widgets/dialog_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

enum ModelMS{
  Edit, Delete
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key,required this.message, required this.uid}) : super(key: key);
  final Message message;
  final String uid;
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    showDialog(ModelMS model){
      DialogWidget(
        context,
        titleDialog: model == ModelMS.Delete ? "Delete" : "Edit your comment",
        content: model == ModelMS.Delete ? Text("Do you want to delete comment ?") : Container(
          child: CupertinoTextField(
            controller: messageController,
            minLines: 1,
            maxLines: 8,
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //border: Border.all(width: 1, color: kColorsGrey)
            )
          ),
        ),
        actions: [
          CupertinoDialogAction(child: Text("OK"),onPressed: ()=>Navigator.pop(context)),
          CupertinoDialogAction(child: Text("Cancel"),onPressed: ()=>Navigator.pop(context),),
        ]
      ).showCupertinoDialog();
    }
    return Container(
      padding: EdgeInsets.all(8),
      child: 
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
            ),
            SizedBox(width: width  * 0.04,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: width * 0.1),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(message.userName,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          Text(timeago.format(message.date),style: TextStyle(color: Colors.black.withOpacity(0.7)))
                        ],
                      ),
                      // TextField(controller: messageController,
                      //   readOnly: true,
                      //   minLines: 1,
                      //   maxLines: 10,
                      //   decoration: InputDecoration(
                      //     border: InputBorder.none
                      //   ),
                      // )
                      Text(message.message)
                    ]
                  ),
                  if(message.uid == uid)
                  Divider(color: Colors.black,),
                  if(message.uid == uid)
                  Row(
                    children: [
                      GestureDetector(onTap:(){
                        messageController.text = message.message;
                        showDialog(ModelMS.Edit);
                      }, child: Text("Edit",style: TextStyle(color: const Color(0xFF6F6CEE)),)),
                      Text(" - "),
                      GestureDetector(onTap:(){showDialog(ModelMS.Delete);},child: Text("Delete",style: TextStyle(color: const Color(0xFF6F6CEE)),)),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}