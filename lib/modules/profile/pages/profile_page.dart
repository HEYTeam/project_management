

import 'package:flutter/material.dart';
import 'package:manager_app/logic/colors.dart';
import 'package:manager_app/models/user.dart';
import 'package:manager_app/widgets/avatar_widget.dart';
import 'package:manager_app/widgets/menu_item_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;

  final List<Map<String,Object>> itemPart1 = [
    {
      "title": "Members",
      "icon": Icons.card_membership
    },
    {
      "title": "Report",
      "icon": Icons.chat_rounded
    },
    {
      "title": "Achievement",
      "icon": Icons.cloud_upload
    },
    {
      "title": "Setting",
      "icon": Icons.settings
    }
    
  ];

  final List<Map<String,Object>> itemPart2 = [
    {
      "title": "Help & Support",
      "icon": Icons.help
    },
    {
      "title": "Privacy",
      "icon": Icons.privacy_tip_rounded
    },
  ];

  final List<Map<String,Object>> itemPart3 = [
    {
      "title": "Logout",
      "icon": Icons.logout
    }
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        taskComplete(count: "20",title: "Complete",flex: 3),
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: size.maxHeight * 0.14,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: AvatarWidget(
                                radius: 50,
                                image: user.image,
                              ),
                            ),
                          ),
                        ),
                        taskComplete(count: "20",title: "Complete",flex: 3),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Nguyễn Văn Toán", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                    Text("Developer")
                  ],
                ),
              ),
              Divider(),
              Expanded(
                flex: 7,
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                        ...menu(itemPart1, size.maxWidth),
                        SizedBox(height: size.maxHeight * 0.05,),
                        ...menu(itemPart2,size.maxWidth),
                        SizedBox(height: size.maxHeight * 0.05,),
                        ...menu(itemPart3,size.maxWidth),
                    ],
                  ),
                )
              )
            ],
          ),
        );      
      },
    );
  }

  List<Widget> menu(List<Map<String,Object>> menuItem, double width){
    return  menuItem.map((item) => Container(
      padding:EdgeInsets.all(20.0),
      //height: 50,
      child: MenuItem(
        space: width * 0.02, 
        icon: item['icon'] as IconData, 
        title: item['title'] as String, 
        trailing: Icon(Icons.arrow_forward_ios, color: kColorsBlue,),)
      )
    ).toList();
  }


  Widget taskComplete({int? flex = 3,required String count, required String title}){
    return Expanded(
      flex: flex!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(count),
          Text(title)
        ],
      ),
    );
  }

}