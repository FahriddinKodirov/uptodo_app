import 'dart:ffi';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uptodo_app/homework/database/servis/storage_service.dart';
import 'package:uptodo_app/homework/database/task_item.dart';
import 'package:uptodo_app/homework/database/todo_model.dart';
import 'package:uptodo_app/homework/database/update_task_widget.dart';
import 'package:uptodo_app/theme_Provider.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_image.dart';
import '../database/local_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search = '';
  int countOfCompleted = 0;
  int countOfUncompleted = 0;
  int isCompletedNumber = 0;
  void initState() {
    super.initState();
    isCompletedNumber = StorageService.getInt('isCompletedNumber');
  }
  var number;

  @override
  Widget build(BuildContext context) {
   var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight? Colors.white: Colors.black,
      appBar: AppBar(
      
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(24),
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Color(363636),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(MyImages.clock),
                        SizedBox(height: 12),
                        Text(
                          "Please hold your finger at "
                          "the fingerprint scanner to verify your identity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.87),
                              fontSize: 20),
                        ),
                        SizedBox(height: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // minimumSize: const Size(150, 48),
                                primary: Color(0xFF363636),
                                shadowColor: null,
                                elevation: 0,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF8875FF)),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // minimumSize: const Size(150, 48),
                                primary: Color(0xFF8687E7),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Use Password",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
          icon: SvgPicture.asset(MyImages.ic_menu,color: isLight? Colors.black: Colors.white,),
        ),
        backgroundColor: isLight? Colors.white: Colors.black,
        title: Text("HomePage".tr(), style: TextStyle(color: isLight? Colors.black: Colors.white,),),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/30",
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            searchTodo(isLight),
            todayTodos(isLight),
            completedTodos(isLight),
          ],
        ),
      ),
    );
  }

  Widget searchTodo(isLight) {
    return    Container(
                          height: MediaQuery.of(context).size.height*0.07,
                          width: MediaQuery.of(context).size.width*0.9,
                          decoration: BoxDecoration(
                            color: isLight? Colors.black.withOpacity(0.1): Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white54)
                          ),
                          child: TextField(
                            cursorHeight: 28,
                            onChanged: (value) {
                              search = value;
                            },
                            enableIMEPersonalizedLearning:false,
                            strutStyle:StrutStyle(fontSize: 22),
                            style: TextStyle(color: Colors.white,
                            fontSize: 20),
                            decoration: InputDecoration(
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.search,color: isLight? Colors.black: Colors.white,
                                size: 40,),
                              )
                              ,
                              border: InputBorder.none,
                              alignLabelWithHint:false,
                              
                      
                              hintText: 'Search for your task...'.tr(),
                              hintStyle: TextStyle(color: isLight? Colors.black: Colors.white),
                              
                      
                            )
                ),
                );
  }

  Widget todayTodos(isLight) {
    return Container(
      
      child: ExpansionTile(
        initiallyExpanded : true,
        iconColor: isLight? Colors.black: Colors.white,
        
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Uncompleted'.tr(),
            style: TextStyle(color: isLight? Colors.black: Colors.white),
          ),
        ),
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: LocalDatabase.getTodosIsCompleted(0, title: search),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasData) {
                  countOfUncompleted = snapshot.data!.length;
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                        child: Icon(
                      Icons.file_copy_outlined,
                      color: Colors.white,
                      size: 96,
                    ));
                  }
                 
                  return ListView.builder(
                    
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                        return TaskItem(
                        
                        onCompleted: (todo) {
                          setState(() {
                            
                            LocalDatabase.updateTaskById(
                              todo.copyWith(isCompleted: 1),
                            );
                          });
                        },
                        Model: snapshot.data![index],
                        onDeleted: () {
                          setState(() {});
                        },
                        onSelected: () {
                          showModalBottomSheet(
                            backgroundColor: Color(0xFF363636),
                            context: context,
                            builder: (context) {
                              return UpdateTaskWidget(
                                todo: snapshot.data![index],
                                onUpdatedTask: () {
                                  setState(() {});
                                },
                              );
                            },
                          );
                        }, 
                      );


                     
                      }
                      
                    
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return Column(
                  children: [
                    SizedBox(height: 20,),
                    shimmer(),
                    SizedBox(height: 30,),
                    shimmer(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget completedTodos(isLight) {
    return Container(
      child: ExpansionTile(
        initiallyExpanded : true,
        iconColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Completed'.tr(),
            style: TextStyle(color: isLight? Colors.black: Colors.white),
          ),
        ),
        children: [
          FutureBuilder(
            future: LocalDatabase.getTodosIsCompleted(1, title: search),
            builder:
                (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasData) {
                countOfCompleted = snapshot.data!.length;
                if (snapshot.data!.isEmpty) {
                  return const Center(
                      child: Icon(
                    Icons.file_copy_outlined,
                    color: Colors.white,
                    size: 96,
                  ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      Model: snapshot.data![index],
                      onCompleted: (todo) {
                        setState(() {
                          LocalDatabase.updateTaskById(
                            todo.copyWith(isCompleted: 0),
                          );
                        });
                      },
                      onDeleted: () {
                        setState(() {});
                      },
                      onSelected: () {
                        showModalBottomSheet(
                          backgroundColor: Color(0xFF363636),
                          context: context,
                          builder: (context) {
                            return UpdateTaskWidget(
                              todo: snapshot.data![index],
                              onUpdatedTask: () {
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return shimmer();
            },
          ),
        ],
      ),
    );
  }

  Widget shimmer(){
    return Container(
                  height: 70,
                  width: 370,
                  child: Shimmer.fromColors(
                            baseColor: Colors.grey[500]!, 
                            highlightColor: Colors.grey[100]!,
                            child: 
                            Stack(children: [
                              Container(
                                height: 80,
                                width: 370,
                              ),
                              Positioned(
                                left: 55,
                                top: 15,
                                child: Container(
                                  height: 10,
                                  width: 70,
                                  color: Colors.black,
                                ) ),
                                Positioned(
                                left: 55,
                                top: 40,
                                child: Container(
                                  height: 10,
                                  width: 100,
                                  color: Colors.black,
                                ),
                                ),
                                Positioned(
                                left: 348,
                              
                                child: Container(
                                  height: 13,
                                  width: 13 ,
                                  decoration: BoxDecoration(
                                   color: Colors.black, 
                                   shape: BoxShape.circle
                                  ),),
                                ),
                                Positioned(
                                left: 1,
                                top: 15,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                   color: Colors.black, 
                                   shape: BoxShape.circle
                                  ),),
                                ),
                                Positioned(
                                left: 230,
                                top: 30,
                                child: Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  
                                ),
                                ),
                              Positioned(
                                left: 310,
                                top: 30,
                                child: Container(
                                  height: 30,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  
                                ),
                                ),
                            ],), 
                            
                            ),
                );
  }
}











// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:uptodo_app/homework/database/local_database.dart';
// import 'package:uptodo_app/homework/database/task_item.dart';
// import 'package:uptodo_app/homework/database/todo_model.dart';
// import 'package:uptodo_app/homework/database/update_task_widget.dart';
// import 'package:uptodo_app/utils/my_colors.dart';
// import 'package:uptodo_app/utils/my_image.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String search = '';
//   int countOfCompleted = 0;
//   int countOfUncompleted = 0;
  
//   @override
//   Widget build(BuildContext context) {
//   var height1 = MediaQuery.of(context).size.height; 
//   var width1 = MediaQuery.of(context).size.width; 
//     return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   centerTitle: true,
      //   leading: IconButton(
      //     onPressed: () {
      //       showModalBottomSheet(
      //           backgroundColor: Colors.transparent,
      //           context: context,
      //           builder: (BuildContext context) {
      //             return Container(
      //               padding: EdgeInsets.all(24),
      //               height: 350,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(16),
      //                   topRight: Radius.circular(16),
      //                 ),
      //                 color: Color(363636),
      //               ),
      //               child: Column(
      //                 children: [
      //                   SvgPicture.asset(MyImages.clock),
      //                   SizedBox(height: 12),
      //                   Text(
      //                     "Please hold your finger at "
      //                     "the fingerprint scanner to verify your identity",
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                         color: Colors.white.withOpacity(0.87),
      //                         fontSize: 20),
      //                   ),
      //                   SizedBox(height: 48),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           // minimumSize: const Size(150, 48),
      //                           primary: Color(0xFF363636),
      //                           shadowColor: null,
      //                           elevation: 0,
      //                         ),
      //                         onPressed: () {},
      //                         child: const Text(
      //                           "Cancel",
      //                           style: TextStyle(
      //                               fontSize: 16, color: Color(0xFF8875FF)),
      //                         ),
      //                       ),
      //                       ElevatedButton(
      //                         style: ElevatedButton.styleFrom(
      //                           // minimumSize: const Size(150, 48),
      //                           primary: Color(0xFF8687E7),
      //                         ),
      //                         onPressed: () {},
      //                         child: const Text(
      //                           "Use Password",
      //                           style: TextStyle(fontSize: 16),
      //                         ),
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             );
      //           });
      //     },
      //     icon: SvgPicture.asset(MyImages.ic_menu),
      //   ),
      //   backgroundColor: Colors.black,
      //   title: Text("HomePage"),
      //   actions: [
      //     ClipRRect(
      //       borderRadius: BorderRadius.circular(50),
      //       child: CircleAvatar(
      //         radius: 24,
      //         backgroundImage: NetworkImage(
      //           "https://i.pravatar.cc/30",
      //         ),
      //       ),
      //     ),
      //     SizedBox(width: 12),
      //   ],
      // ),
      
      // backgroundColor:MyColors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
            // Container(
            //               height: MediaQuery.of(context).size.height*0.07,
            //               width: MediaQuery.of(context).size.width*0.9,
            //               decoration: BoxDecoration(
            //                 color: Color(0xFF01D1D1D),
            //                 borderRadius: BorderRadius.circular(8),
            //                 border: Border.all(color: Colors.white54)
            //               ),
            //               child: TextField(
            //                 cursorHeight: 28,
            //                 onChanged: (value) {
            //                   search = value;
            //                 },
            //                 enableIMEPersonalizedLearning:false,
            //                 strutStyle:StrutStyle(fontSize: 22),
            //                 style: TextStyle(color: Colors.white,
            //                 fontSize: 20),
            //                 decoration: InputDecoration(
                              
            //                   icon: Padding(
            //                     padding: const EdgeInsets.only(left: 10),
            //                     child: Icon(Icons.search,color: Colors.white70,
            //                     size: 40,),
            //                   )
            //                   ,
            //                   border: InputBorder.none,
            //                   alignLabelWithHint:false,
                              
                      
            //                   hintText: 'Search for your task...',
            //                   hintStyle: TextStyle(color: Colors.white70),
                              
                      
            //                 )
            //     ),
            //     ),
//             ExpansionTile(
//               iconColor: Colors.white,
//               title: Text(
//               'Uncompleted',
//                style: TextStyle(color: Colors.white),
//               ),
//               children: [
//               SingleChildScrollView(
//                 child: FutureBuilder(
//                 future: LocalDatabase.getTaskByTitle(title: search),
//                 builder: (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot){
//                   if(snapshot.hasData) {
//                     if(snapshot.data!.isEmpty) {
//                       return Column(
//                         children: [
//                           SizedBox(height: height1*0.12,),
//                           Container(
//                             alignment: Alignment.center,
                           
                            
//                             child: SvgPicture.asset(MyImages.manu,
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             child: Text('What do you want to do today?', style: TextStyle(color: 
//                             Colors.white, fontSize: height1*0.025),),),
//                             SizedBox(height: height1*0.02,),
//                           Container(
//                             alignment: Alignment.center,
//                             child: Text('Tap + to add your tasks', style: TextStyle(color: 
//                             Colors.white, fontSize: height1*0.025),),)
//                         ],
//                       );
//                     }
//                     return Column(
//                       children: [
//                          SizedBox(height: 20,),
//                           Container(
//                             alignment: Alignment.topLeft,
//                             margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.68),
//                             height: MediaQuery.of(context).size.height*0.038,
//                             width: MediaQuery.of(context).size.width*0.22,
//                             decoration: BoxDecoration(
//                              color: Color(0xFF363636), 
//                              borderRadius: BorderRadius.circular(5)
//                             ),
                            
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 2,),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
                              
//                                 Text('Today',style: TextStyle(color: Colors.white),),
//                                 Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
//                               ],),
//                             )
//                           ),
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: snapshot.data?.length ?? 0,
//                             itemBuilder: (context, index){
//                               return TaskItem(
//                                 onCompleted: (todo) {
//                                  setState(() {
//                                    LocalDatabase.updateTaskById(
//                                     todo.copyWith(isCompleted: 1)
//                                    );
//                                  });
//                                 },
//                                 Model: snapshot.data?[index],
//                                 onDeleted: () {
//                                   setState(() {});
//                                 },
//                                 onSelected: () {
//                                   showModalBottomSheet(
//                                     isScrollControlled: true,
//                                     context: context, 
//                                     builder: (context){
//                                       return UpdateTaskWidget(onUpdatedTask: (){
//                                         setState(){}
//                                       }, todo: snapshot.data![index],
//                                       );
//                                     });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text(snapshot.error.toString()),
//                     );
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 },
//                           ),
//               ),


//               ],
//               ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }
   