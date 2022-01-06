import 'package:bybloom_mvp/home/homescreen.dart';
import 'package:bybloom_mvp/mainscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'byBloom MVP',
      home: MainScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.grey
          )
        )
      ),
    );
  }
}

