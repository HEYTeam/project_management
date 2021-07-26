

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.04, vertical: size.maxHeight * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back!",style: TextStyle(fontSize: 30),),
                          SizedBox(height: size.maxHeight * 0.001,),
                          Text("Create your account")
                        ],
                      ),//
                      SizedBox(height: size.maxHeight * 0.12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name", textAlign: TextAlign.start,style: TextStyle(fontSize: 18, color: Colors.black87),),
                          SizedBox(height: size.maxHeight * 0.006),
                          textField(hint:"Enter your account"),
                          SizedBox(height: size.maxHeight * 0.025),
                          Text("Password", textAlign: TextAlign.start,style: TextStyle(fontSize: 18, color: Colors.black87),),
                          SizedBox(height: size.maxHeight * 0.006),
                          textField(hint: "Enter your password"),
                          SizedBox(height: size.maxHeight * 0.025),
                          Text("Password", textAlign: TextAlign.start,style: TextStyle(fontSize: 18, color: Colors.black87),),
                          SizedBox(height: size.maxHeight * 0.006),
                          textField(hint: "Enter your password")
                        ],
                      ),//
                      SizedBox(height: size.maxHeight * 0.1,),
                      MaterialButton(
                        onPressed: ()=>{},
                        child: Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                          color: Colors.blue,
                          minWidth: size.maxWidth,height: 50,
                      ),
                      SizedBox(height: size.maxHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text("Have don't you account ? ", overflow: TextOverflow.ellipsis,)),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, '/signin');
                          }, child: Text("Sign Up"))
                        ],
                      ),
                    ],
                  ),
                ),
            );
          },
        ),
      ),
    );
  }

  Widget textField({required String hint}){
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter your account",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        )
      ),
    );//
  }


  Row buttonWith({required IconData icon, required String name}){
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: IconButton(onPressed: (){}, icon: Icon(icon)),
        ),
        Text(name)
      ],
    );
  }
}