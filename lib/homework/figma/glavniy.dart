import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class Glavniy extends StatefulWidget {
  const Glavniy({super.key});

  @override
  State<Glavniy> createState() => _GlavniyState();
}

class _GlavniyState extends State<Glavniy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(MyImages.ic_menu),
        ),
        backgroundColor: Colors.black,
        title: Text("HomePage"),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body:  Column(children: [
         Container(
          color: MyColors.black,
          height: MediaQuery.of(context).size.height*0.8641,
          width: MediaQuery.of(context).size.width,
           child: Column(
             children: [
              SizedBox(height: 5,),
               Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.87,
                    decoration: BoxDecoration(
                      color: Color(0xFF01D1D1D),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white54)
                    ),
                    child: TextField(
                      cursorHeight: 28,
                      
                      enableIMEPersonalizedLearning:false,
                      strutStyle:StrutStyle(fontSize: 22),
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),
                      decoration: InputDecoration(
                        
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.search,color: Colors.white70,
                          size: 40,),
                        )
                        ,
                        border: InputBorder.none,
                        alignLabelWithHint:false,
                        
                
                        hintText: 'Search for your task...',
                        hintStyle: TextStyle(color: Colors.white70),
                        
                
                      )
          ),),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(right: 235),
                    height: MediaQuery.of(context).size.height*0.038,
                    width: MediaQuery.of(context).size.width*0.22,
                    color: Color(0xFF363636),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      
                        Text('Today',style: TextStyle(color: Colors.white),),
                        Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                      ],),
                    )
                  ),
                  SizedBox(height: 20,),
                  tablitsa1(),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(right: 210),
                    height: MediaQuery.of(context).size.height*0.038,
                    width: MediaQuery.of(context).size.width*0.28,
                    color: Color(0xFF363636),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      
                        Text('Completed',style: TextStyle(color: Colors.white),),
                        Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                      ],),
                    )
                  ),
                  SizedBox(height: 20,),
                  tablitsa2(),
             ],
           ),
         ),
      ],)
    );
  }

  Widget tablitsa1(){
    return  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.87,
                    decoration: BoxDecoration(
                      color: Color(0xFF363636),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.05,
                        child: Radio(
                           splashRadius: 1,
                           value: 1, 
                                      groupValue: 2, 
                                      onChanged: ((value) {
                                        
                                      })),
                      ),
                      Stack(children: [
                        Container(
                          height: 200,
                          width: 280,
                        ),
                        Positioned(
                          top: 16,
                          left: 20,
                          child: Text('Do Math Homework',style: TextStyle(color: Colors.white70,fontSize: 15),),),
                          SizedBox(height: 4,)
,                        Positioned(
                          top: 45,
                          left: 20,
                        child: Text('Today At 16:45',style: TextStyle(color: Colors.white54, fontSize: 13))),
                        Positioned(
                          top: 42,
                          left: 145,
                          child: Container(
                            
                            height: MediaQuery.of(context).size.height*0.04,
                            width: MediaQuery.of(context).size.width*0.2,
                            decoration: BoxDecoration(
                              color: Color(0xFF809CFF),
                              borderRadius: BorderRadius.circular(7)
                            ),
                            child: Center(child: Text('University',style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        Positioned(
                          top: 42,
                          left: 235,
                          child: Container(
                            
                            height: MediaQuery.of(context).size.height*0.04,
                            width: MediaQuery.of(context).size.width*0.12,
                            decoration: BoxDecoration(
                              color: Color(0xFF363636),
                              border: Border.all(color: Color(0xFF809CFF)),
                              borderRadius: BorderRadius.circular(7)
                            ),
                            child: Row(children: [
                              Container(child: SvgPicture.asset(MyImages.flag)),
                              SizedBox(width: 5,),
                              Container(child: Text('1', style: TextStyle(color: Colors.white,
                              fontSize: 17),)),
                            ],)
                          ),
                        ),
                      ],)

                    ],),
                    
                  );
  }

   Widget tablitsa2(){
    return  Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.87,
                    decoration: BoxDecoration(
                      color: Color(0xFF363636),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.05,
                        child: Radio(
                           splashRadius: 1,
                           value: 1, 
                                      groupValue: 2, 
                                      onChanged: ((value) {
                                        
                                      })),
                      ),
                      Stack(children: [
                        Container(
                          height: 200,
                          width: 280,
                        ),
                        Positioned(
                          top: 16,
                          left: 20,
                          child: Text('Buy Grocery',style: TextStyle(color: Colors.white70,fontSize: 17),),),
                          SizedBox(height: 4,)
,                        Positioned(
                          top: 45,
                          left: 20,
                        child: Text('Today At 16:45',style: TextStyle(color: Colors.white54, fontSize: 15))),
                       
                      ],)

                    ],),
                    
                  );
  }
}