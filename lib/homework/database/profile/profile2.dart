import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/homework/database/local_database.dart';
import 'package:uptodo_app/homework/database/profile/setting.dart';
import 'package:uptodo_app/homework/database/profile/theme_Mode_Item.dart';
import 'package:uptodo_app/homework/database/todo_model.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

import '../../../theme_Provider.dart';
import '../servis/storage_service.dart';

class Profile2 extends StatefulWidget {
  TodoModel? Model;
  Profile2({super.key,
            required this.Model});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
   final formKey = GlobalKey<FormState>();
  String newName = '';
  String accontName = '';
  @override
  void initState() {
    super.initState();
    accontName = StorageService.getString("accontName");
  }
  
  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      body: SingleChildScrollView(
            
            child: SizedBox(
              height: MediaQuery.of(context).size.height*1.32,
              child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: isLight? Colors.white:MyColors.black,
              child: Form(
                key: formKey,
                child: Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  Container(
                  child: Center(child: Text('Profile'.tr(),style: TextStyle(color: isLight? Colors.black:Colors.white,fontSize: 25),)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  Container(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage("https://i.pravatar.cc/30"),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                  Container(child: Text(accontName, style: TextStyle(fontSize: 25, color: isLight? Colors.black:Colors.white))),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.085,
                      width: MediaQuery.of(context).size.width*0.41,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isLight? Colors.black.withOpacity(0.06):Color(0xFF363636)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('10 Task left'.tr(),style: TextStyle(color: isLight? Colors.black:Colors.white,fontSize: 20)),
                      ) ,
                      ),
                      Container(
                      height: MediaQuery.of(context).size.height*0.085,
                      width: MediaQuery.of(context).size.width*0.41,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: isLight? Colors.black.withOpacity(0.06):Color(0xFF363636)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('5 Task done'.tr(),style: TextStyle(color: isLight? Colors.black:Colors.white,fontSize: 20),),
                      ) ,
                      ),
                     
                   ],),),
                   
                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                   Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30),
                    child: Text('settings'.tr(),style: TextStyle(color: isLight? Colors.black54:Colors.white54))),
                   InkWell(
                   onTap: (() {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> Setting()));
                   }),  
                   child: titleWidget(isLight,MyImages.setting,'App Settings'.tr())),
                   ThemeModeItem(),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  
                   Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30),
                    child: Text('Account'.tr(),style: TextStyle(color: isLight? Colors.black54:Colors.white54))),

                   InkWell(onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context)=> AlertDialog(
                        scrollable: true,
                        backgroundColor: isLight?Colors.white:Color(0xFF363636),
                        insetPadding: EdgeInsets.all(10),
                        contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
                        content: Container(
                          height: MediaQuery.of(context).size.height*0.23,
                          width: MediaQuery.of(context).size.width*0.85,
                          child: Column(children: [
                            SizedBox(height: 4,),
                            Container(
                              child: Text('Change account name'.tr(),style: TextStyle(color: isLight?Colors.black:Colors.white,
                              fontSize: 18),),
                            ),
                            SizedBox(height: 4,),
                            Divider(thickness: 0.7,color: isLight?Colors.black:Colors.white,),
                            Container(
                              margin: EdgeInsets.only(top: 12,left: 15,right: 15),
                              decoration: BoxDecoration(
                                
                                border: Border.all(color: isLight?Colors.black:Colors.white54)
                              ),
                              child: TextFormField(
                               initialValue: accontName,
                               onChanged: (val) {
                               accontName = val;
                               },
                               cursorHeight: 28,
                    
                               strutStyle:StrutStyle(fontSize: 22),
                               style: TextStyle(color: isLight?Colors.black:Colors.white,
                               fontSize: 20),
                               decoration: InputDecoration(
                      
                               contentPadding: EdgeInsets.only(left: 10),
                               border: InputBorder.none,
                               alignLabelWithHint:false,
                      
                          
                              
                          
                              )
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                            StorageService.saveString("accontName", accontName);
                            Navigator.pop(context);
                            setState(() {
                              
                            });
                            
                           }, child: Padding(
                             padding: const EdgeInsets.only(right: 5),
                             child: Container(
                               height: 50,
                               width: 140,
                               decoration: BoxDecoration(
                                color: MyColors.purple,
                                borderRadius: BorderRadius.circular(4.5)
                               ),
                             
                              child: Container(
                             
                                child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))),
                           ))
                          ],
                        ),
                          ]),
                        ),
              
                        ));
                   },
                   child: titleWidget(isLight,MyImages.account_name,'Change account name'.tr()),
                   ),
                   
                   SizedBox(height: 2,),
                   titleWidget(isLight,MyImages.account_password,'Change account password'.tr()),
                   SizedBox(height: 2,),
                   titleWidget(isLight,MyImages.account_image,'Change account Image'.tr()),
                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                   Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30),
                    child: Text('Uptodo',style: TextStyle(color: isLight? Colors.black54:Colors.white54))),
                   titleWidget(isLight,MyImages.about_us,'About US'.tr()),
                   SizedBox(height: 2,),
                   titleWidget(isLight,MyImages.faq,'FAQ'.tr()),
                   SizedBox(height: 2,),
                   titleWidget(isLight,MyImages.help_feedback,'Help & Feedback'.tr()),
                   SizedBox(height: 2,),
                   titleWidget(isLight,MyImages.support,'Support US'.tr()),
                   
                   ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: SvgPicture.asset(MyImages.login_out,width: 26,),
                      ),
                      title: Text('Log out'.tr(),style: TextStyle(color: Colors.red,fontSize: 18),),
                    ),
                 
                ]),
              ),
                    ),
            ),
          ),
    );
  }
   Widget titleWidget(isLight,icon, word){
    return Container(
      child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: SvgPicture.asset(icon,width: 26,color: isLight? Colors.black:Colors.white,),
                      ),
                      title: Text(word,style: TextStyle(color: isLight? Colors.black:Colors.white,fontSize: 18),),
                      trailing: SvgPicture.asset(MyImages.right,width: 26,color: isLight? Colors.black:Colors.white,),
                    ),
    );
  }
}

// InkWell(
//                     onTap: (() {
//                       showDialog(
//                         context: context, 
//                         builder: (context)=> AlertDialog(
//                         scrollable: true,
//                         backgroundColor: Color(0xFF363636),
//                         insetPadding: EdgeInsets.all(10),
//                         contentPadding: EdgeInsets.only(top: 8,left: 8,right: 8),
//                         content: Container(
//                           height: MediaQuery.of(context).size.height*0.23,
//                           width: MediaQuery.of(context).size.width*0.85,
//                           child: Column(children: [
//                             SizedBox(height: 4,),
//                             Container(
//                               child: Text('Change account name',style: TextStyle(color: Colors.white,
//                               fontSize: 18),),
//                             ),
//                             SizedBox(height: 4,),
//                             Divider(thickness: 0.7,color: Colors.white,),
//                             Container(
//                               margin: EdgeInsets.only(top: 12,left: 15,right: 15),
//                               decoration: BoxDecoration(
                                
//                                 border: Border.all(color: Colors.white54)
//                               ),
//                               child: TextFormField(
//                                onSaved: (val) {
//                                newName = val ?? "";
//                                },
//                                cursorHeight: 28,
                    
//                                strutStyle:StrutStyle(fontSize: 22),
//                                style: TextStyle(color: Colors.white,
//                                fontSize: 20),
//                                decoration: InputDecoration(
                      
//                                contentPadding: EdgeInsets.only(left: 10),
//                                border: InputBorder.none,
//                                alignLabelWithHint:false,
                      
                          
                              
                          
//                               )
//                               ),
//                             ),
//                             SizedBox(height: MediaQuery.of(context).size.height*0.03,),
//                             Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 65),
//                               child: InkWell(
//                                 onTap: (() {
//                                   Navigator.pop(context);
//                                 }),
//                                 child: Text('Cancel', style: TextStyle(color: MyColors.purple,),)),
//                             ),
//                           InkWell(
//                            onTap: (){
//                             formKey.currentState?.save();
//                              var newTodo = TodoModel(
//                              title: 'newTitle',
//                              description: 'newDescription',
//                              date: 'newDate3',
//                              priority: 'newprority',
//                              isCompleted: 0,
//                              name: ''
//                              );
//                              LocalDatabase.insertToDatabase(newTodo);
//                              Navigator.pop(context);
                            
//                            }, child: Padding(
//                              padding: const EdgeInsets.only(right: 5),
//                              child: Container(
//                                height: 50,
//                                width: 140,
//                                decoration: BoxDecoration(
//                                 color: MyColors.purple,
//                                 borderRadius: BorderRadius.circular(4.5)
//                                ),
                             
//                               child: Container(
                             
//                                 child: Center(child: Text('Save', style: TextStyle(color: Colors.white),)))),
//                            ))
//                           ],
//                         ),
//                           ]),
//                         ),
              
//                         ));
//                     }),
//                     child: 