import 'package:flutter/material.dart';
import 'package:paws_mate/home.dart';
import 'package:pawsmate/home.dart';
import 'package:pawsmate/login.dart';
import 'package:flutter/services.dart';

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
      home: HomeUI() 
      
    );
  }
      
}
