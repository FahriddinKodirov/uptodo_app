import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/homework/figma/register.dart';
import 'package:uptodo_app/my_home_page.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class Finger extends StatefulWidget {
  const Finger({super.key});

  @override
  State<Finger> createState() => _FingerState();
}

class _FingerState extends State<Finger> {
  bool isTrue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        color: MyColors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF363636),
              child: Column(children: [
                SizedBox(height: 30,),
                Container(
                  child: isTrue?InkWell(
                    onTap: (() {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
                    }),
                    child: SvgPicture.asset(MyImages.code)):
                  SvgPicture.asset(MyImages.code,color: Colors.red,)
                ),
                SizedBox(height: 20,),
                isTrue?Container(
                  child: Text('Please hold your finger at the', style: TextStyle(color: 
                  Colors.white, fontSize: 20),),
                ): Text(' Your fingerprint is not', style: TextStyle(color: 
                  Colors.red, fontSize: 20),),
                SizedBox(height: 2,),
                isTrue?Container(
                  child: Text('fingerprint scanner to verify your', style: TextStyle(color: 
                  Colors.white, fontSize: 20)),
                ):Text('matched.Please try again later!!!', style: TextStyle(color: 
                  Colors.red, fontSize: 20),),
                SizedBox(height: 2,),
                isTrue?Container(
                  child: Text('dentity', style: TextStyle(color: 
                  Colors.white, fontSize: 20)),
                ): Text('', style: TextStyle(color: 
                  Colors.red, fontSize: 20),),
                SizedBox(height: 40,),
                
                 Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (() {
                           setState(() {
                            isTrue = true;
                          });
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Cancel', style: TextStyle(color: Color(0xFF8687E7),
                              fontSize: 20),),
                            ),
                          ),
                        InkWell(
                         
                         onTap: (){
                          setState(() {
                            isTrue = false;
                          });
                          
                         }, child: Container(
                          margin: EdgeInsets.only(left: 40),
                          color: MyColors.purple,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                            child: Text('Use Password', style: TextStyle(color: Colors.white),))))
                        ],
                      ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}