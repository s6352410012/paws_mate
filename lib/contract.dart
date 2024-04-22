import 'package:flutter/material.dart';

void main() {
  runApp(ContractUI());
}

class ContractUI extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '''
                กฎและข้อบังคับในการรับเลี้ยงสัตว์จาก PawsMate

                1. ผู้รับเลี้ยงจะต้องมีอายุ 20 ปีขึ้นไป
                2. ผู้รับเลี้ยงจะต้องสามารถเลี้ยงดูสัตว์ได้ตลอดชีวิต
                3. ผู้รับเลี้ยงจะต้องไม่นำสัตว์ไปขายต่อ
                4. ผู้รับเลี้ยงจะต้องไม่นำสัตว์ไปทรมานหรือทำร้าย
                5. ผู้รับเลี้ยงจะต้องชำระค่าธรรมเนียมการรับเลี้ยง 500 บาท
                6. ผู้รับเลี้ยงจะต้องทำสัญญารับเลี้ยง
                7. ผู้รับเลี้ยงจะต้องนำสัตว์ไปฉีดวัคซีน ถ่ายพยาธิ และฝังไมโครชิพ
                8. ทาง PawsMate จะเป็นผู้ส่งมอบให้ถึงสถานที่ๆระบุไว้
                  ''',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20), // เพิ่มระยะห่างระหว่างข้อความและปุ่ม
                ElevatedButton(
                  onPressed: () {
                    // จัดการเหตุการณ์เมื่อปุ่มถูกกด
                    // เพิ่มโค้ดเพื่อดำเนินการต่อ
                  },
                  child: Text('ตกลงทำสัญญาในการรับอุปการะ'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
