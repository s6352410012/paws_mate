// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(NavigUI());

// class NavigUI extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<NavigUI> {


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Floating NavBar Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Floating NavBar Example'),
//           centerTitle: true,
//         ),
//         //If you want to show body behind the navbar, it should be true
//         extendBody: true,
//         body: Center(
//           child: Text(
//             "index: $_index",
//             style: TextStyle(
//               fontSize: 52,
//             ),
//           ),
//         ),
//         bottomNavigationBar: FloatingNavbar(
//           onTap: (int val) => setState(() => _index = val),
//           currentIndex: _index,
//           items: [
//             FloatingNavbarItem(icon: Icons.home, title: 'Home'),
//             FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
//             FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
//             FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
//           ],
//         ),
//       ),
//     );
//   }
// }