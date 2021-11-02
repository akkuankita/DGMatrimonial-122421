import 'package:flutter/material.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/BottomTab/ExploreScreen.dart';
import 'package:matrimonial/view/BottomTab/ProfileScreen.dart';
import 'package:matrimonial/view/dashboard/chat/MainChatPage.dart';
import 'package:matrimonial/view/Profile/profile.dart';
import 'package:matrimonial/view/dashboard/save_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  List _screens = [
    ExploreScreen(),
    SavePage(),
    MainChatPage(),
    ProfileScreen()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: mainColor,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Saved",
            icon: Icon(Icons.bookmark_add_rounded),
          ),
          BottomNavigationBarItem(
            label: "Chat",
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
