import 'package:flutter/material.dart';
import 'package:paws_mate/home.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';


void main() {
  runApp(FulldetailUI());
}

class FulldetailUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 231, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset('assets/images/pawsMate logo resize.png'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // Handle account button press
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImageWithBorder('assets/images/iconhome.png', 130, 130,
                      Color.fromRGBO(248, 165, 215, 1), 'บ้าน', context),
                  SizedBox(width: 10),
                  _buildImageWithBorder('assets/images/iconApartment.png', 130,
                      130, Color.fromRGBO(255, 220, 220, 1), 'คอนโด, อพาร์ตเม้นท์', context),
                ],
              ),
              SizedBox(height: 10),
              _buildImageWithBorder('assets/images/otherchoose.png', 130, 130,
                  Color.fromRGBO(238, 184, 197, 1), 'อื่นๆ', context),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 150,
          height: 50,
          child: FloatingActionButton.extended(
            onPressed: () {
              // Navigate to HomeUI
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeUI()),
              );
            },
            backgroundColor: Colors.black,
            label: Text(
              'ยกเลิก',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            icon: Icon(Icons.cancel, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithBorder(
      String imagePath, double borderWidth, double borderHeight, Color borderColor, String text, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Add your onTap functionality here
            print('Image tapped');
          },
          child: Container(
            width: borderWidth,
            height: borderHeight,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(borderWidth / 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}