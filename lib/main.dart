import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paws_mate/account.dart';
import 'package:paws_mate/choosetype.dart';
import 'package:paws_mate/forget.dart';
import 'package:paws_mate/home.dart';
import 'package:paws_mate/login.dart';
import 'package:paws_mate/register.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PawsMate',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 232, 147, 176),
        
        primaryColor: Color.fromARGB(244, 250, 140, 243),
      ),
      home: ChooseUI() 
      
    );
  }
      
}
