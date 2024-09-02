import 'package:flutter/material.dart';
import 'package:newapp/Home_Screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes:{
        HomeScreen.routName:(_) => HomeScreen(),
      },
    );
  }
}