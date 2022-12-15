import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class Calendar123 extends StatefulWidget {
  const Calendar123({super.key});

  @override
  State<Calendar123> createState() => _Calendar123State();
}

class _Calendar123State extends State<Calendar123> {
  int index = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyColors.black,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.22,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                                      height: MediaQuery.of(context).size.height*0.52,
                                      width: MediaQuery.of(context).size.width*0.92,
                                      color: Color(0xFF363636),
                                      child: Column(
                                        
                                        children: [
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                            
                                              IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_outlined,
                                              color: Colors.white,size: 35,)),
                                            
                                            Column(
                                              children: [
                                                Text('NOVEMBER', style: TextStyle(fontSize: 18, color: Colors.white),),
                                                Text('2022', style: TextStyle(fontSize: 18, color: Colors.white),)
                                              ],
                                            ),
                                            Container(
                                              child: IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_outlined,
                                              color: Colors.white,size: 35,)),
                                            )
                                          ],),
                                          Divider(thickness: 0.7,color: Colors.white70,),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 2),
                                              child: Text('MON', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white),),
                                            ),
                                            Text('TUE', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white),),
                                            Text('WED', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white),),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('THU', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('FRI', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white),),
                                            ),
                                            Text('SAT', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.red),),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('SUN', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.red),),
                                            ),
                                          ],),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height*0.32,
                                              width: MediaQuery.of(context).size.height,
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                              
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
                                                itemCount: 35,
                                                itemBuilder: ((context, count) {
                                                  count += 30; 
                                                  count += 1;
                                                  if(count > 31 && count < 62){
                                                    count -= 30;
                                              
                                                  }
                                                 
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                    child: InkWell(
                                                      
                                                      onTap: (){
                                                        setState(() {
                                                       
                                                        });
                                                      },
                                                      child: Container(
                                                      width: 8,
                                                      height: 8,
                                                      color: count < 31?Color(0xFF272727):null,
                                                      child: Center(child: Text((count > 61?count-=61:count).toString(),style: TextStyle(color: Colors.white),)),
                                                                                            ),
                                                    ),
                                                  );
                                                }),
                                                 
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12,),
                                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: InkWell(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                                ),
                              InkWell(
                               onTap: (){
                                setState(() {});
                                
                               }, child: Padding(
                                 padding: const EdgeInsets.only(right: 10),
                                 child: Container(
                                   height: 50,
                                   width: 150,
                                  color: MyColors.purple,
                                  child: Container(
                                    
                                    child: Center(child: Text('Choose Time', style: TextStyle(color: Colors.white),)))),
                               ))
                              ],
                            ),
                                        ],
                                      ),),
          ),
        ],
      ),
                                
                                
                           
                        
    );
  }
}