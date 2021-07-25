

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/logic/data.dart';
import 'package:manager_app/modules/notification/pages/notification_page.dart';
import 'package:manager_app/modules/profile/pages/profile_page.dart';
import 'package:manager_app/modules/task/pages/dasboard_page.dart';
import 'logic/colors.dart';
import 'modules/reports/pages/report_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final _page = [
    DasboardPage(projectList: PROJECT,),
    ReportPage(),
    NotificationPage(notifications: notifications,projects: PROJECT,),
    ProfilePage(user: user1,),
  ];
  final _itemBar = {
    {
      "title": "Home", "icon": Icons.home, "index":0
    },
    {
      "title": "Report", "icon": Icons.pie_chart, "index":1
    },
    {
      "title": "Notification", "icon": Icons.notifications, "index":2
    },
    {
      "title": "Profile", "icon": Icons.account_circle, "index":3
    }
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[currentIndex],
      bottomSheet: BottomAppBar(
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _itemBar.map((itemBar) => bottomNavigationItemBar(icon: itemBar['icon'] as IconData,index: itemBar['index'] as int, title: itemBar['title'] as String)).toList()
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationItemBar({required String title, required IconData icon, required int index}){
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              setState(() {
                currentIndex = index;
              });
            }, icon: Icon(icon,color: kColorsBlue,)),
            Text(title, style: TextStyle(fontWeight: index == currentIndex ? FontWeight.bold : FontWeight.w400),)
          ],
        )
      ],
    );
  }

}