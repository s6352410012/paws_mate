import 'package:flutter/material.dart';
import 'package:paws_mate/home.dart';
import 'package:paws_mate/register.dart';
import 'package:paws_mate/forget.dart'; 

class LoginUI extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 225, 220, 252),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/pawsMate logo resize.png',
              ),
              const SizedBox(height: 30),
              const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'กรอกชื่อผู้ใช้',
                  hintStyle: TextStyle(fontSize: 16.0),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'รหัสผ่าน',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'กรอกรหัสผ่าน',
                  hintStyle: TextStyle(fontSize: 16.0),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Handle checkbox value change
                        },
                      ),
                      Text('จดจำฉันไว้ในระบบ'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetUI()), // Navigate to ForgetUI
                      );
                    },
                    child: Text('ลืมรหัสผ่าน'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeUI()),
                        );
                      },
                      icon: Icon(Icons.login),
                      label: Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterUI()),
                        );
                      },
                      icon: const Icon(Icons.app_registration_outlined),
                      label: Text(
                        "สมัครสมาชิก",
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality for login with Gmail
                },
                icon: Image.asset(
                  'assets/images/googleicon.png', // Replace with your Gmail icon asset
                  width: 24,
                  height: 24,
                ),
                label: Text('เข้าสู่ระบบด้วย Gmail', style: TextStyle(fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}