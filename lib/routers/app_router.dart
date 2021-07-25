



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/models/project.dart';
import 'package:manager_app/models/task.dart';
import 'package:manager_app/modules/auth/pages/signin_page.dart';
import 'package:manager_app/modules/auth/pages/signup_page.dart';
import 'package:manager_app/home_page.dart';
import 'package:manager_app/modules/task/pages/project_detail_page.dart';
import 'package:manager_app/modules/task/pages/task_detail_page.dart';

class AppRouter{
  Route? onGenerateRouter(RouteSettings router){
    final arg = router.arguments;
    switch(router.name){
      case '/': return MaterialPageRoute(builder: (context) => SignInPage(),);
      case '/signup':return MaterialPageRoute(builder: (context) => SignUpPage());
      case '/home': return MaterialPageRoute(builder: (context) => HomePage());
      case '/project_detail': 
        Project project = arg as Project;
        return MaterialPageRoute(builder: (context) => ProjectDetailPage(project: project,));
      case '/task_detail_page': 
        final agrs = arg as Map<String,Object>;
        return MaterialPageRoute(builder: (context) => TaskDetailPage(task: agrs['task'] as Task,project: agrs['project'] as Project));
    }
  }
}