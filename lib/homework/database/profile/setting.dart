import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/homework/database/profile/radia.dart';
import 'package:uptodo_app/utils/my_colors.dart';
import 'package:uptodo_app/utils/my_image.dart';

import '../../../theme_Provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    return Scaffold(
      backgroundColor: isLight?Colors.white:MyColors.black,
      appBar: AppBar(
        backgroundColor: isLight?Colors.white:MyColors.black,
        elevation: 0,
        leading: IconButton(
          splashRadius: 10,
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: isLight?Colors.black:Colors.white,),
          onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text('Settings', style: TextStyle(color: isLight?Colors.black:Colors.white),),
      ),
      body: Column(children: [
        Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 25),
                    child: Text('settings',style: TextStyle(color: Colors.white54))),
         titleWidget(isLight, context,MyImages.colors,'Change app color'.tr(),Container()),
         titleWidget(isLight, context,MyImages.text,'Change app typography'.tr(),Container()),
         titleWidget(isLight, context,MyImages.translation,'Change app language'.tr(),SelectLang(),),  
         SizedBox(height: 20,),
         Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 25),
                    child: Text('import',style: TextStyle(color: Colors.white54))),
         titleWidget(isLight, context,MyImages.outline,'Import from Google calendar'.tr(),Container()),   
      ],),
    );
  }

   Widget titleWidget(isLight, context, icon, word,SelectLang){
    return ExpansionTile(
      leading: SvgPicture.asset(icon,width: 26,color: isLight?Colors.black:Colors.white, ),
      title: Text(word,style: TextStyle(color: isLight?Colors.black:Colors.white,fontSize: 18),),
      trailing: SvgPicture.asset(MyImages.right,width: 26,color: isLight?Colors.black:Colors.white,),
      children: [
      Container(
        height: MediaQuery.of(context).size.height*0.21,
        width: MediaQuery.of(context).size.width*0.85,
        decoration: BoxDecoration(
         color: isLight?Colors.black.withOpacity(0.1):Color(0xFF363636), 
         borderRadius: BorderRadius.circular(8)
        ),
        
        child: SelectLang,
      )
      ],
    );
  }
}