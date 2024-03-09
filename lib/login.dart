import 'package:flutter/material.dart';

class LoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 171, 227),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/pawsMate logo resize.png', // เส้นทางของภาพ
              ),
              const SizedBox(height: 50),
              const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0), // กรอบมน
                  ),
                  hintText: 'กรอกชื่อผู้ใช้',
                  hintStyle: TextStyle(fontSize: 16.0), // ปรับขนาดตัวอักษร
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'รหัสผ่าน*',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0), // กรอบมน
                  ),
                  hintText: 'กรอกรหัสผ่าน',
                  hintStyle: TextStyle(fontSize: 16.0), // ปรับขนาดตัวอักษร
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeUI()), // Navigate to HomeScreen
                  );
                },
                icon: Icon(Icons.login),
                label: Text(
                  "เข้าสู่ระบบ",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: Size(200, 50),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add functionality when the button is pressed
                },
                icon: const Icon(Icons.app_registration_outlined),
                label: Text(
                  "สมัครสมาชิก",
                  style: TextStyle(fontSize: 20),
                ),
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
