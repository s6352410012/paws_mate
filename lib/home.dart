import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Favorite Page'),
    Text('Inbox Page'),
    Text('Story Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 147, 176),
        title: Text('suphakit jabsungneon'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // รหัสเมื่อไอคอน Profile ถูกคลิก
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // สีพื้นหลังของ Navbar
        unselectedItemColor: Colors.white70, // สีของไอคอนเมื่อไม่ได้เลือก
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(Icons.home,
                    color: Colors.yellow) // สีไอคอนของ Home เมื่อถูกเลือก
                : Icon(Icons.home,
                    color: Colors.black), // สีไอคอนของ Home เมื่อไม่ได้เลือก
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset(
                    'assets/images/iconfavblack.png',
                    color: Colors.yellow, // สีไอคอนเมื่อถูกเลือก
                    width: 25, // ปรับขนาดความกว้างตามที่ต้องการ
                    height: 25, // ปรับขนาดความสูงตามที่ต้องการ
                  )
                : Image.asset(
                    'assets/images/iconfavblack.png',
                    color: Colors.black, // สีไอคอนเมื่อไม่ได้เลือก
                    width: 25, // ปรับขนาดความกว้างตามที่ต้องการ
                    height: 25, // ปรับขนาดความสูงตามที่ต้องการ
                  ),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(Icons.inbox,
                    color: Colors.yellow) // สีไอคอนของ Inbox เมื่อถูกเลือก
                : Icon(Icons.inbox,
                    color: Colors.black), // สีไอคอนของ Inbox เมื่อไม่ได้เลือก
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Image.asset(
                    'assets/images/iconreserve.png',
                    color: Colors.yellow, // สีไอคอนเมื่อถูกเลือก
                    width: 25, // ปรับขนาดความกว้างตามที่ต้องการ
                    height: 25, // ปรับขนาดความสูงตามที่ต้องการ
                  ) // สีไอคอนของ Home เมื่อถูกเลือก
                : Image.asset(
                    'assets/images/iconreserve.png',
                    color: Colors.black, // สีไอคอนเมื่อไม่ได้เลือก
                    width: 25, // ปรับขนาดความกว้างตามที่ต้องการ
                    height: 25, // ปรับขนาดความสูงตามที่ต้องการ
                  ),   // สีไอคอนของ Story เมื่อไม่ได้เลือก
            label: 'Story',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow, // สีเมื่อไอเท็มถูกเลือก
        onTap: _onItemTapped,
      ),
    );
  }
}
