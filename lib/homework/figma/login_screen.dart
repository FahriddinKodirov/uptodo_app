import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/homework/figma/register.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                SizedBox(height: 20,),
                 Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30),
              child: Text('Login', style: TextStyle(fontSize: 28,color: 
              Colors.white),),
            ),
            SizedBox(height: 45,),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text('Username', style: TextStyle(color: Colors.white70,fontSize: 16),),
            ),
            SizedBox(height: 10,),
            Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  color: MyColors.black,
                  border: Border.all(color: Colors.white54)
                ),
                child: TextField(
                  cursorHeight: 28,
                  
                  enableIMEPersonalizedLearning:false,
                  strutStyle:StrutStyle(fontSize: 22),
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    contentPadding: EdgeInsets.all(12),
            
                    hintText: 'Enter your Username',
                    hintStyle: TextStyle(color: Colors.white70),
                    
            
                  )
          ),),
          SizedBox(height: 20,),
                 Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text('Password', style: TextStyle(color: Colors.white70,fontSize: 16),),
            ),
            SizedBox(height: 10,),
            Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  color: MyColors.black,
                  border: Border.all(color: Colors.white54)
                ),child:
                TextField(
                  cursorHeight: 28,
                
                  enableIMEPersonalizedLearning:false,
                  strutStyle:StrutStyle(fontSize: 28),
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  obscureText: true,
                  selectionWidthStyle: BoxWidthStyle.max,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    contentPadding: EdgeInsets.all(12),
                    
                    hintText: '??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ??? ???',
                    hintStyle: TextStyle(color: Colors.white70,
                    fontSize: 34,height: 2,),
                    
            
                  )
          ),),
             SizedBox(height: 75,),
                InkWell(
                  splashColor: MyColors.purple,
                  onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (_)=> Register()));
            
                  },
                  child: Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.85,
                  decoration: BoxDecoration(
                    color: Color(0xFF4C4C7C),
                  ),child: Center(child: Text('Login', style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),
                ),
                SizedBox(height: 25,),
                Container(child: SvgPicture.asset(MyImages.dvider),),
                SizedBox(height: 35,),
                
                 Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  color: MyColors.black,
                  border: Border.all(color: MyColors.purple)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Image.asset(MyImages.google,width: 25,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Lohin with google',style: TextStyle(
                    fontSize: 18, color: Colors.white),)),
                    
                    
                  ],
                ),
              ),
              SizedBox(height: 20,),
                Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  color: MyColors.black,
                  border: Border.all(color: MyColors.purple)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 85),
                      child: SvgPicture.asset(MyImages.apple, width: 25,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Login with apple',style: TextStyle(
                    fontSize: 18, color:Colors.white ),)),
                    
                    
                  ],
                ),
              ),
              SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Text('Don???t have an account?',style: 
                  TextStyle(color: Colors.white54),),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Register()));
                    },
                    child: Container(
                    padding: EdgeInsets.only(left: 2),  
                    child: Text('Register',style: 
                    TextStyle(color: Colors.white)),),
                  ),
                ],
              )
        
           
          ],),
        ),
      ),
    );
  }
}