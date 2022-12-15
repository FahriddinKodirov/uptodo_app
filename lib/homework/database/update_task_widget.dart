import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:uptodo_app/homework/database/home.dart';
import 'package:uptodo_app/homework/database/local_database.dart';
import 'package:uptodo_app/homework/database/todo_model.dart';
import 'package:uptodo_app/utils/my_image.dart';

import '../../utils/my_colors.dart';



class UpdateTaskWidget extends StatefulWidget {
  TodoModel todo;
  VoidCallback onUpdatedTask;

  UpdateTaskWidget({Key? key, required this.onUpdatedTask,
                              required this.todo}) : super(key: key);

  @override
  State<UpdateTaskWidget> createState() => _UpdateTaskWidgetState();
}

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  String newprority = '';
  String newName = '';

  bool isTrue = false;
  bool isFalse = false;
  bool ochlok = false;
  bool color = false;
  int Calendar = 0;
  int indexColor = 0;
  int newIsComplement = 0;
  String newDate1 = '';
  String newDate2 = '';
  String newDate3 = '';
  String newDate4 = '';
  String newDate5 = '';
  int _currentIntValue1 = 1;
  int _currentIntValue2 = 1;
  String sord = 'am';
  int count = 0;
  List list = [
    'AM',
    'PM'
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF363636),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                color: Color(0xFF363636),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
              ),
              child: Column(children: [
                SizedBox(height: 26,),
                 Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 25),
              child: Text('Add Task', style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height*0.064,
                width: MediaQuery.of(context).size.width*0.90,
                
                child: TextFormField(
                  initialValue: widget.todo.title,
                  onSaved: (val) {
                   newTitle = val ?? "";
                 },
                  cursorHeight: 28,
                  
                  strutStyle:StrutStyle(fontSize: 22),
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  decoration: InputDecoration(
                    
                    focusedBorder: OutlineInputBorder(
                    borderRadius:const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.white54)),
                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    
            
                    hintText: 'Do math homework',
                    hintStyle: TextStyle(color: Colors.white70),
                    
            
                  )
          ),),
         
            SizedBox(height: 4,),
            Container(
                padding: EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height*0.064,
                width: MediaQuery.of(context).size.width*0.90,
                
                child:
                TextFormField(
                  initialValue: widget.todo.description,
                  onSaved: (val) {
                   newDescription = val ?? "";
                 },
                  cursorHeight: 28,
                  strutStyle:StrutStyle(fontSize: 22),
                  style: TextStyle(color: Colors.white,
                  fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                    borderRadius:const BorderRadius.all(Radius.circular(8)
                    ),
                    borderSide: BorderSide(color: Colors.white54)),

                    border: InputBorder.none,
                    alignLabelWithHint:false,
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.white54),
                    hintText: 'Do chapter 2 to 5 for next week',
                    hintStyle: TextStyle(color: Colors.white70,
                    ),
                    
                          
                  )
                        ),),
                  
                
                        SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                               ochlok = !ochlok;
                            });
                          
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25),
                            child: SvgPicture.asset(MyImages.clock),
                          ),
                        ),
 
                      InkWell(
                          onTap: () {
                           
                            showDialog(
                              
                             context: context, 
                              builder: (((context) => AlertDialog(
                                scrollable: true,
                                contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
                                content:Container(
                                height: MediaQuery.of(context).size.height*0.42,
                                width: MediaQuery.of(context).size.height*0.9,
                                color: Color(0xFF363636),
                                child: Column(
                                  children: [
                                    Divider(thickness: 0.7,color: Colors.white70,),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.32,
                                      width: MediaQuery.of(context).size.height*0.9,
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                                        itemCount: 10,
                                        itemBuilder: ((context, index) {
                                          index += 1;
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              
                                              onTap: (){
                                                setState(() {
                                                  newprority = index.toString();
                                                  indexColor = index;
                                                  
                                                });
                                              },
                                              child: Container(
                                              width: 50,
                                              height: 50,
                                              color: indexColor == index?MyColors.purple:Color(0xFF272727),
                                              child: Column(children: [
                                                SizedBox(height: 5,),
                                                Container(
                                                  child: SvgPicture.asset(MyImages.flag, width: 26,),),
                                                SizedBox(height: 3,),
                                                Container(child: Text(index.toString(),style: TextStyle(fontSize: 22, color: 
                                                Colors.white),),)
                                              ],)
                                                                                    ),
                                            ),
                                          );
                                        }),
                                         
                                      ),
                                    ),
                                    
                                    // SizedBox(height: 32,),
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
                              Navigator.pop(context);
                              newprority = newprority;

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
                                ),),
                                backgroundColor: Color(0xFF363636),
                                titlePadding: EdgeInsets.only(left: 110,top: 15),
                                title: Text('Task Priority',style: TextStyle(color: Colors.white),),
                                      ))));
      
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25),
                            child: SvgPicture.asset(MyImages.flag),
                          ),
                        ),
                        

                      InkWell(
                  onTap: () {
                    setState(() {
                      newIsComplement = 1;
                    });
                      
                    },
                  child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: SvgPicture.asset(MyImages.vuesax),
                          )),
                          InkWell(
                  onTap: () {
                    showDialog(
                             context: context, 
                              builder: (((context) => AlertDialog(
                                backgroundColor: Color(0xFF363636),
                                contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
                                content:Container(
                                height: MediaQuery.of(context).size.height*0.485,
                                color: Color(0xFF363636),
                                  child: Column(
        children: [
          Container(
                                      height: MediaQuery.of(context).size.height*0.485,
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
                                              child: Text('MON', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white
                                              ,fontSize: 12),),
                                            ),
                                            Text('TUE', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white,fontSize: 12),),
                                            Text('WED', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white,fontSize: 12),),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('THU', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white,fontSize: 12),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('FRI', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.white,fontSize: 12),),
                                            ),
                                            Text('SAT', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.red,fontSize: 12),),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4),
                                              child: Text('SUN', style: TextStyle(fontWeight:FontWeight.w600, color: Colors.red,fontSize: 12),),
                                            ),
                                          ],),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height*0.28,
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
                                                    count -= 31;
                                              
                                                  }
                                                 
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                                                    child: InkWell(
                                                      
                                                      onTap: (){
                                                        setState(() {
                                                        newDate4 = (count > 61?count-=61:count).toString();
                                                       
                                                        });
                                                      },
                                                      child: Container(
                                                      width: 8,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                       color: count < 31?Color(0xFF272727):null,
                                                       borderRadius: BorderRadius.circular(4) 
                                                      ),
                                                      
                                                      child: Center(child: Text((count > 61?count-=61:count).toString(),style: TextStyle(color: Colors.white,
                                                      fontSize: 12),)),
                                                                                            ),
                                                    ),
                                                  );
                                                }),
                                                 
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 12,),
                                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50, top: 10),
                                  child: InkWell(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                                ),
                            InkWell(
                             onTap: (){
                                setState(() {
                                  Navigator.pop(context);
                                });
                                
                             }, child: Padding(
                                 padding: const EdgeInsets.only(right: 5, top: 10),
                                 child: Container(
                                   height: 50,
                                   width: 140,
                                  color: MyColors.purple,
                                  child: InkWell(
                                    onTap: (() {
                                      newDate3 = '$newDate4 - November $newDate1 : $newDate2';
                                    }),
                                    child: Container(
                                      
                                      child: Center(child: Text('Choose Time', style: TextStyle(color: Colors.white),))),
                                  )),
                             ))
                            ],
                          ),
                                        ],
                                      ),),
        ],
      ),
                                ),
                               
                                      ))));
                    },
                  child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Icon(Icons.calendar_month,color: Colors
                  .white70,))),
                      
                      
                      ],),
                      InkWell(
                  onTap: () {
                          formKey.currentState?.save();
                  var newTodo = TodoModel(
                    id: widget.todo.id,
                    title: newTitle,
                    description: newDescription,
                    date: newDate3,
                    priority: newprority,
                    isCompleted: newIsComplement,
                    name: newName,
                  );
                  LocalDatabase.updateTaskById(newTodo);
                  
                  widget.onUpdatedTask();
                   setState(() {
                     Navigator.pop(context);
                   });
                    },
                 child: Container(
                  padding: EdgeInsets.only(right: 20),
                   child: SvgPicture.asset(MyImages.telegram),
                          )),
                    
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  ochlok?Container(
                                height: MediaQuery.of(context).size.height*0.25,
                                width: MediaQuery.of(context).size.height*0.9,
                                color: Color(0xFF363636),
                                child: Column(
                                  children: [
                                    Container(child: Text('Choose time',style: TextStyle(color: Colors.white),),),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40, right: 40),
                                      child: Divider(thickness: 0.7,color: Colors.white70,),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 55),
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
                                           maxValue: 23,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() {
                                            _currentIntValue2 = value;
                                            newDate1 = value.toString();
                                           } ),
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
                                           maxValue: 59,
                                           step: 1,
                                           haptics: true,
                                           onChanged: (value) => setState(() {
                                            _currentIntValue1 = value;
                                            newDate2 = value.toString();
                                           } ),
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
                            padding: const EdgeInsets.only(left: 65),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
                          ),
                        InkWell(
                         onTap: (){
                      
                          newDate3 = '$newDate4 - NOVEMBER $newDate1 : $newDate2';
                         }, child: Padding(
                           padding: const EdgeInsets.only(right: 40),
                           child: Container(
                            
                             height: 50,
                             width: 120,
                            color: MyColors.purple,
                            child: Container(
                             
                              child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))),
                         ))
                        ],
                      ),
                                  ],
                                ),
      ):Container(),

              ]),
            ),
        
          
          ],
        ),
      ),
    );
  }
}