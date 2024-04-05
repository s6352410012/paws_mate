import 'package:flutter/material.dart';

import 'package:paws_mate/home.dart';
import 'package:paws_mate/login.dart';
import 'package:paws_mate/navigation.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดการแสดงตัวแบนเนอร์ debug
      title: 'PawsMate',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 232, 147, 176),
        
        primaryColor: Color.fromARGB(244, 250, 140, 243),
      ),
      home:LoginUI(),

    );
  }
      
}
