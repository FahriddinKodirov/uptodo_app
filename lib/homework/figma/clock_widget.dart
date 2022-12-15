import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class ClochWidget extends StatefulWidget {
  const ClochWidget({super.key});

  @override
  State<ClochWidget> createState() => _ClochWidgetState();
}

class _ClochWidgetState extends State<ClochWidget> {
  int _currentIntValue1 = 1;
  int _currentIntValue2 = 1;
  List list = [
    'AM',
    'PM'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
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
      body: Container(
                                height: MediaQuery.of(context).size.height*0.25,
                                width: MediaQuery.of(context).size.height*0.9,
                                color: Color(0xFF363636),
                                child: Column(
                                  children: [
                                    Divider(thickness: 0.7,color: Colors.white70,),
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Row(children: [
                                        
                                        Container(
                                          width: 70,
                                          color: Color(0xFF272727),
                                          child: NumberPicker(
                                           value: _currentIntValue2,
                                           itemHeight: 25,
                                           itemWidth: 80,
                                           
                                           selectedTextStyle:TextStyle(color: Colors.white,fontSize: 25,
                                           fontWeight: FontWeight.w800,),
                                           textStyle: TextStyle(color: Colors.white12,fontSize: 20),
                                           minValue: 0,
                                           maxValue: 24,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() => _currentIntValue2 = value),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        Container(child: Text(':',style: TextStyle(fontSize: 30, color: 
                                        Colors.white),),),
                                        SizedBox(width: 16,),
                                       Container(
                                          width: 70,
                                          color: Color(0xFF272727),
                                          child: NumberPicker(
                                           value: _currentIntValue1,
                                           itemHeight: 25,
                                           itemWidth: 80,
                                           
                                           selectedTextStyle:TextStyle(color: Colors.white,fontSize: 25,
                                           fontWeight: FontWeight.w800,),
                                           textStyle: TextStyle(color: Colors.white12,fontSize: 20),
                                           minValue: 0,
                                           maxValue: 24,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() => _currentIntValue1 = value),
                                          ),
                                        ),
         
                                        
                                        SizedBox(width: 20,),
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
                                          width: 70,
                                          height: 75,
                                          color: Color(0xFF272727),
                                          child: ListView.separated(
                                            itemCount: 2,
                                            itemBuilder: (BuildContext context, int count){
                                              
                                              return Container(
                                                
                                                child: Text(list[count], style: TextStyle(fontSize: 30,color: Colors.white),),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 0.2,);
                                            },
                                            ),
                                            
                                        ),
                                        
                                        
                                      ],),
                                    ),
                                    SizedBox(height: 32,),
                                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                          ),
                        InkWell(
                         onTap: (){
                          setState(() {
                                      //  Navigator.push(context, MaterialPageRoute(builder: (_)=> StartScreen()));

                          });
                          
                         }, child: Container(
                           height: 50,
                           width: 120,
                          color: MyColors.purple,
                          child: Container(
                         
                            child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))))
                        ],
                      ),
                                  ],
                                ),
      ),
    );
  }
}