

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/widgets/avatar_widget.dart';

class ListViewColorWidget extends StatefulWidget {
  const ListViewColorWidget({Key? key,required this.height}) : super(key: key);
  final double height;

  @override
  _ListViewColorWidgetState createState() => _ListViewColorWidgetState();
}

class _ListViewColorWidgetState extends State<ListViewColorWidget> {
  int currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Column(
        children: [
          CupertinoTextField(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1,color: Colors.grey)
            ),
            placeholder: "Name",
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ), 
              itemCount: colorLable.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      currentSelected = index;
                    });
                  },
                  child: AvatarWidget(radius: 20,backgroundColor: colorLable[index],child:currentSelected == index ? Icon(Icons.check): null,)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}