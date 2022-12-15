import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/homework/database/local_database.dart';
import 'package:uptodo_app/homework/database/todo_model.dart';
import 'package:uptodo_app/homework/database/profile/profile2.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final formKey = GlobalKey<FormState>();
  String newName = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder: (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot){
          if(snapshot.hasData) {
            if(snapshot.data!.isEmpty) {
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                  Container(
                    alignment: Alignment.center,
                   
                    
                    child: SvgPicture.asset(MyImages.manu,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('What do you want to do today?', style: TextStyle(color: 
                    Colors.white, fontSize: MediaQuery.of(context).size.height*0.025),),),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Tap + to add your tasks', style: TextStyle(color: 
                    Colors.white, fontSize: MediaQuery.of(context).size.height*0.025),),)
                ],
              );
            }
            }
            return Profile2(Model: snapshot.data?[1]);
        }
      ),
    );
  }

}