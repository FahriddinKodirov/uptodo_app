import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uptodo_app/homework/database/local_database.dart';
import 'package:uptodo_app/homework/database/servis/storage_service.dart';
import 'package:uptodo_app/homework/database/todo_model.dart';
import 'package:uptodo_app/theme_Provider.dart';
import 'package:uptodo_app/utils/my_image.dart';


class TaskItem extends StatefulWidget {
  TodoModel? Model;
  final VoidCallback onDeleted;
  final VoidCallback onSelected;
  final ValueChanged<TodoModel> onCompleted;

  TaskItem({super.key,
            required this.Model,
            required this.onDeleted,
            required this.onSelected,
            required this.onCompleted
            });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool index = false;

  bool isTrue = false;
  

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: widget.onSelected,
        child: Container(
                        height: MediaQuery.of(context).size.height*0.1,
                        width: MediaQuery.of(context).size.height*0.9,
                        decoration: BoxDecoration(
                          color: isLight? Colors.black.withOpacity(0.1):Color(0xFF363636),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(children: [
                            InkWell(
                              onTap: (){
                                widget.onCompleted(widget.Model!);
                              },
                              child: Container(
                               decoration: BoxDecoration(
                               color: widget.Model?.isCompleted == 1
                               ? Colors.green
                               : Colors.transparent,
                               shape: BoxShape.circle,
                               border: Border.all(
                               color: isLight?Colors.black54:Colors.white54,
                                width: 2,
                                )),
                               height: 20,
                               width: 20,
                              ),
                            ),
                                              
                            Stack(children: [
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width*0.82,
                              ),
                                Positioned(
                                 left: MediaQuery.of(context).size.width*0.738,
                                 top: -10,
                                  child: IconButton(
                                   onPressed: () async {
                                    
                                    var res = await LocalDatabase.deleteTaskById(
                                        widget.Model!.id!);
                                
                                    if (res != 0) {
                                    widget.onDeleted();
                                    }
                                  },
                                              
                                              icon: Icon(
                                                Icons.cancel_outlined,
                                                color: isLight? Colors.black:Colors.white54,
                                                size: 25,
                                              )),
                                ),
                              Positioned(
                                top: 16,
                                left: 20,
                                child: Text(widget.Model?.title.toString() ?? "No title",style: TextStyle(color: isLight? Colors.black:Colors.white70,fontSize: 17),),),
                                SizedBox(height: 4,)
                              ,                        Positioned(
                                top: 45,
                                left: 20,
                              child: Text('${widget.Model?.date.toString() ?? "No title"}',style: TextStyle(color: isLight? Colors.black: Colors.white54, fontSize: 15))),
                              Positioned(
                                top: MediaQuery.of(context).size.width*0.105,
                                left: MediaQuery.of(context).size.width*0.45,
                                child: Container(
                                  
                                  height: MediaQuery.of(context).size.height*0.04,
                                  width: MediaQuery.of(context).size.width*0.2,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF809CFF),
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(child: Text(widget.Model?.description.toString() ?? "No priority",style: TextStyle(color: isLight? Colors.black:Colors.white),)),
                                ),
                              ),
                            
                              Positioned(
                                top: MediaQuery.of(context).size.width*0.105,
                                left: MediaQuery.of(context).size.width*0.68,
                                child: Container(
                                  
                                  height: MediaQuery.of(context).size.height*0.04,
                                  width: MediaQuery.of(context).size.width*0.12,
                                  decoration: BoxDecoration(
                                    color: isLight? Colors.white:Color(0xFF363636),
                                    border: Border.all(color: Color(0xFF809CFF)),
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Row(children: [
                                    Container(child: SvgPicture.asset(MyImages.flag, color: isLight? Colors.black:Colors.white,)),
                                    SizedBox(width: 5,),
                                    Container(child: Text(widget.Model?.priority.toString() ?? "0", style: TextStyle(color: isLight? Colors.black:Colors.white,
                                    fontSize: 17),)),
                               
                                  ],)
                                ),
                              ),
                            ],)
                              
                          ],),
                        ),
                        
                      ),
      ),
    );
    // Container(
    //    padding: EdgeInsets.all(12),
    //    margin: EdgeInsets.all(12),
    //    color: Color(0xFF363636),
    //    child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             Model?.id.toString() ?? "-1",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //           SizedBox(height: 8),
    //           Text(
    //             Model?.title.toString() ?? "No title",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //           SizedBox(height: 8),
             
    //           Text(
    //             Model?.priority.toString() ?? "No priority",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ],
    //       ),
    //        IconButton(
    //           onPressed: () {
    //             showDialog(
    //                 context: context,
    //                 builder: (context) {
    //                   return AlertDialog(
    //                     title: Text("Delete"),
    //                     content: Text(
    //                       "Are you sure to delete task ${Model?.title}",
    //                     ),
    //                     actions: [
    //                       TextButton(
    //                         onPressed: () {},
    //                         child: Text("NO"),
    //                       ),
    //                       TextButton(
    //                         onPressed: () async {
    //                           var res = await LocalDatabase.deleteTaskById(
    //                               Model!.id!);

    //                           if (res != 0) {
    //                             Navigator.pop(context);
    //                             onDeleted();
    //                           }
    //                         },
    //                         child: Text("YES"),
    //                       ),
    //                     ],
    //                   );
    //                 });
    //           },
    //           icon: Icon(
    //             Icons.delete_forever,
    //             color: Colors.white,
    //             size: 40,
    //           ))
    //     ],
    //   ),
    // );
    
  }
}