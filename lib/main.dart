import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/homework/database/calendar.dart';
import 'package:uptodo_app/homework/figma/HomePage.dart';
import 'package:uptodo_app/homework/database/home.dart';
import 'package:uptodo_app/homework/database/my_homw_page.dart';
import 'package:uptodo_app/homework/figma/finger.dart';
import 'package:uptodo_app/homework/figma/glavniy.dart';
import 'package:uptodo_app/homework/figma/login_screen.dart';
import 'package:uptodo_app/homework/figma/onboading.dart';
import 'package:uptodo_app/homework/database/profile/profile.dart';
import 'package:uptodo_app/homework/figma/radio.dart';
import 'package:uptodo_app/homework/figma/register.dart';
import 'package:uptodo_app/homework/figma/start_screen.dart';
import 'package:uptodo_app/my_home_page.dart';
import 'package:uptodo_app/theme_Provider.dart';
import 'package:uptodo_app/utils/theme_Data.dart';

import 'homework/database/servis/storage_service.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // StorageService.getInstance();
  
  runApp(
    // EasyLocalization(
    //   supportedLocales: [
    //     Locale('en', 'US'),
    //     Locale('uz', 'UZ'),
    //     Locale('ru', 'RU'),
    //   ],
    //   path: 'assets/translations',
    //   child: 
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (_) => ThemeProvider())
        ],
        child: const MyApp())
        // )
        );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      // theme: Styles.themeData(!context.watch<ThemeProvider>().getIsLight(), context),
      // themeMode: context.watch<ThemeProvider>().getIsLight()
      // ? ThemeMode.dark
      // : ThemeMode.light,
      home: MainPage1(),
    );
  }
}

