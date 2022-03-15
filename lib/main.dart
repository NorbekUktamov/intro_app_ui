import 'package:flutter/material.dart';
import 'package:intro_app_ui/pages/home_page.dart';
import 'package:intro_app_ui/pages/intro_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: IntroPage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        IntroPage.id:(context)=>IntroPage(),
      },
    );
  }
}
