import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uptodo_app/homework/figma/login_screen.dart';
import 'package:uptodo_app/homework/figma/start_screen.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class Onboading extends StatefulWidget {
  Onboading({super.key});

  @override
  State<Onboading> createState() => _OnboadingState();
}

class _OnboadingState extends State<Onboading> {
  List list = [
   MyImages.onboading1,
   MyImages.onboading2,
   MyImages.onboading3,
  ];

  List list2 = [
   'Manage your tasks',
   'Create daily routine',
   'Orgonaize your tasks',
  ];

  List list3 = [
   'You can easily manage all of your daily',
   'In Uptodo  you can create your',
   'You can organize your daily tasks by',
  ];

  List list4 = [
   'tasks in DoMe for free',
   'personalized routine to stay productive',
   'adding your tasks into separate categories',
  ];

  List list5 = [
   'Next',
   'Next',
   'Get Started',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page(context)
    
    );
  }

  Widget page(context){
    return Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: PageView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index){
        return Container(
      
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: MyColors.black,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 60,left: 15),
                child: Text('SKIP', style: TextStyle(color: Colors.white54,),),
              ),
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    index == 0?Container(
                      child: Image.asset(list[index], width: 260)):Container(
                      child: Image.asset(list[index], width: 310)),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(
                           color: index == 0?Color(0xFFFFFFFF):Color(0xFFAFAFAF), 
                           borderRadius: BorderRadius.circular(15)
                          ),
                          
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(
                           color: index == 1?Color(0xFFFFFFFF):Color(0xFFAFAFAF), 
                           borderRadius: BorderRadius.circular(15)
                          ),
                          
                        ),
                        SizedBox(height: 70,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(
                           color: index == 2?Color(0xFFFFFFFF):Color(0xFFAFAFAF), 
                           borderRadius: BorderRadius.circular(15)
                          ),
                          
                        ),
                      ],
                    ),
                    Container(
                      child: Text(list2[index], style: TextStyle(color: Colors.white,
                      fontSize: 30))
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: Container(
                        child: Text(list3[index], style: TextStyle(color: Colors.white38,
                        fontSize: 16)))),
                    Center(
                      child: Container(
                        child: Text(list4[index], style: TextStyle(color: Colors.white38,
                        fontSize: 16)))),
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('BACK', style: TextStyle(color: Colors.white54,),),
                          ),
                        TextButton(
                         onPressed: (){
                          setState(() {
                                       Navigator.push(context, MaterialPageRoute(builder: (_)=> StartScreen()));

                          });
                          
                         }, child: Container(
                          margin: EdgeInsets.only(right: 10),
                          color: MyColors.purple,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Text(list5[index], style: TextStyle(color: Colors.white),))))
                        ],
                      ),
                    ),
                    Container(
                      // height: 20,
                      
                    )
                    
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      );
       }),
      );
     
  }
}