import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manager_app/models/task.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key, this.height = 80, required this.task}) : super(key: key);
  final double? height;
  final Task task;

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDAE6FF).withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: widget.task.isState ? Colors.green : Colors.grey, width: 2),
        ),
        height: widget.height,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  checkColor: Colors.blue,
                  value: widget.task.isState, onChanged: (state){
                  setState(() {
                    widget.task.isState = state!;
                  });
                }),
                Text(widget.task.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                //Spacer(),
                IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){},)
              ],
            ),
            Text("${DateFormat.yMMMd().format(widget.task.startDate)} - ${DateFormat.yMMMd().format(widget.task.endDate)}")
          ],
        ),
      ),
    );
  }
}