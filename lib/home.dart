import 'package:chatt_app/utils/colors.dart';
import 'package:chatt_app/views/message.dart';
import 'package:chatt_app/views/notification.dart';
import 'package:chatt_app/views/proba_page.dart';
import 'package:fluttericon/iconic_icons.dart';

import 'package:chatt_app/views/homePage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  List<Widget> pages = [const HomePage(), const messageScreen(), const NotificationPage(), const ProbaPage('neutral')];
  void _onChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onChanged,
          children: pages,
        ),
        bottomNavigationBar: Container(
          color: bkgrdColor,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: bkgrdColor,
            unselectedItemColor: unSelectedIcon,
            selectedItemColor: selectedIcon,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit_outlined), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.phone), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: ""),
            ],
          ),
        ));
  }
}
