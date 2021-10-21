import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimonial/utils/const.dart';
import 'package:matrimonial/view/BottomTab/ChatScreen.dart';
import 'package:matrimonial/view/BottomTab/ExploreScreen.dart';
import 'package:matrimonial/view/BottomTab/ProfileScreen.dart';
import 'package:matrimonial/view/BottomTab/SavedScreen.dart';


/// This is the stateful widget that the main application instantiates.
class MyTabBar extends StatefulWidget {
  @override
  State<MyTabBar> createState() => _MyTabBar();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyTabBar extends State<MyTabBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    SavedScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // icon: SvgPicture.asset("assets/icon/home.svg"),
            label: 'Explore',
            // activeIcon: SvgPicture.asset(
            //   "assets/icon/home.svg",
            //   color: kPrimaryColor,
            // ),
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_rounded),
            //icon: SvgPicture.asset("assets/icon/search.svg"),
            label: 'Saved',
            // activeIcon: SvgPicture.asset(
            //   "assets/icon/search.svg",
            //   color: kPrimaryColor,
            // ),
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            // icon: SvgPicture.asset("assets/icon/compass.svg"),
            label: 'Chat',
            // activeIcon: SvgPicture.asset(
            //   "assets/icon/compass.svg",
            //   color: kPrimaryColor,
            // ),
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            //icon: SvgPicture.asset("assets/icon/thermometer.svg"),
            label: 'Profile',
            // activeIcon: SvgPicture.asset(
            //   "assets/icon/thermometer.svg",
            //   color: kPrimaryColor,
            // ),
            backgroundColor: white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedFontSize: 12.sp,
        selectedFontSize: 12.sp,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: white,
        onTap: _onItemTapped,
      ),
    );
  }
}
