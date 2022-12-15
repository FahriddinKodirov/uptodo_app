import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uptodo_app/homework/figma/login_screen.dart';
import 'package:uptodo_app/utils/my_colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyColors.black,
        child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 50, left: 10),
            child: IconButton(
             color: Colors.white,
             icon: Icon(Icons.arrow_back_ios_new),
             onPressed: () {
              Navigator.pop(context);
            },
            
            ),),
            SizedBox(height: 40,),
            Container(
              child: Text('Welcome to UpTodo',style: TextStyle(fontSize: 37,
              color: Colors.white),),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text('Please login to your account or create',style: TextStyle(fontSize: 20,
              color: Colors.white38),),
            ),
            Container(
              child: Text(' new account to continue',style: TextStyle(fontSize: 20,
              color: Colors.white38),),
            ),
            SizedBox(height: 400),
            InkWell(
              onTap: (() {
                           Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen()));

              }),
              child: Container(
                height: 50,
                width: 360,
                color: MyColors.purple,
                child: Center(child: Text('LOGIN', style: TextStyle(fontSize: 18,
                color: Colors.white),),),
            
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 360,
              decoration: BoxDecoration(
                color: MyColors.black,
                border: Border.all(color: MyColors.purple,width: 2)
              ),
              
              child: Center(
                child: Text('CREATE ACCOUNT', style: TextStyle(fontSize: 16,
              color: Colors.white),),),

            ),
        ]),
      ),
      
    );
  }
}