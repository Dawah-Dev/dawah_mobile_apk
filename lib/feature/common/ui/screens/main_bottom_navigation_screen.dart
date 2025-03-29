import 'package:dawah_mobile_application/app/app_icon.dart';
import 'package:dawah_mobile_application/feature/home/ui/screens/home_screen.dart';
import 'package:dawah_mobile_application/feature/search/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({super.key});

  static String name = '/MainBottomNavigationScreen';

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,forceMaterialTransparency: true,),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: 'Subscribe'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: 'Profile'),
        ],
      ),
    );
  }
}
