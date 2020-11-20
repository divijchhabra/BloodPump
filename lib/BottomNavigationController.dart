
import 'package:blood_pump/HomeScreen.dart';
import 'package:blood_pump/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'PostScreen.dart';

class BottomNavigationBarController extends StatefulWidget {
  static const String id = 'bottom_screen';

  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('Page1'),
    ),
    ProfileScreen(
      key: PageStorageKey('Page2'),
    ),
    ProfileScreen(
      key: PageStorageKey('Page3'),
    ),
    PostScreen(
      key: PageStorageKey('Page4'),
    ),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    fixedColor: Colors.red.shade700,
    unselectedItemColor: Colors.grey,
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard), label: 'Post'),

      BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded), label: 'Profile'),

      BottomNavigationBarItem(

          icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
