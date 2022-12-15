import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/utils/my_image.dart';

import '../../../theme_Provider.dart';
import '../servis/storage_service.dart';

class ThemeModeItem extends StatefulWidget {
  const ThemeModeItem({super.key});

  @override
  State<ThemeModeItem> createState() => _ThemeModeItemState();
}

class _ThemeModeItemState extends State<ThemeModeItem> {
   bool isLight = StorageService.getBool("isLight");
   

  @override
  Widget build(BuildContext context) {
    var isLight = context.watch<ThemeProvider>().getIsLight();
    var themeChanger = Provider.of<ThemeProvider>(context);
    return Container(
       child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Icon(Icons.light_mode,color: isLight?Colors.black:Colors.white,size: 24,),
                    ),
                    title: Text('Light mode',style: TextStyle(color: isLight?Colors.black:Colors.white, fontSize: 19),),
                    trailing: Switch(
                      activeColor: Colors.blue,
                      activeTrackColor: isLight?Colors.black.withOpacity(0.3):Colors.white24,
                      inactiveTrackColor: Colors.white24,
                       value: isLight, 
                       onChanged: ((value) {
                         setState(() {
                           isLight = !isLight;
                         });
                          themeChanger.setIsLight(isLight);
                       })
                  ),
    ));
  }
}