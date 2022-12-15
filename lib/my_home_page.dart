import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo_app/homework/figma/onboading.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    onNextPage();
  }

   onNextPage(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboading()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
        body: InkWell(
          radius: 5,
         onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (_)=> Onboading()));
         },
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: SvgPicture.asset(MyImages.uptodo, width: 180,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text('UpTodo',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500,
                    color:Colors.white),),
                  )
                ],
              ),
            ),
          ),
        )
          
    );
  }
}