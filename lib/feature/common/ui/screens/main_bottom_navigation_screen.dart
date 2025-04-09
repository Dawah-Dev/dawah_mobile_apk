import 'package:dawah_mobile_application/feature/home/ui/screens/home_screen.dart';
import 'package:dawah_mobile_application/feature/profile/ui/screens/profile_screen.dart';
import 'package:dawah_mobile_application/feature/search/ui/screens/search_screen.dart';
import 'package:dawah_mobile_application/feature/subscribe/ui/screens/subscribe_screen.dart';
import 'package:dawah_mobile_application/third_party_library/mini_player/miniplayer.dart';
import 'package:dawah_mobile_application/third_party_library/mini_player/src/utils.dart' show percentageFromValueInRange;
import 'package:dawah_mobile_application/feature/video%20player/ui/screens/video_play_screen.dart';
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
  double playerMinHeight = 60;
  double playerMaxHeight = 370;
  bool _videoPlayerIsVisible = false;

  final MiniplayerController _miniplayerController = MiniplayerController();
  final ValueNotifier<double> playerExpandProgress = ValueNotifier<double>(60);


  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    SubscribeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    playerMaxHeight = MediaQuery.of(context).copyWith().size.height;

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,forceMaterialTransparency: true,),
      body: SafeArea(
        child: Stack(
          children: [
            _screens[_currentIndex],

            if(_videoPlayerIsVisible)
            Miniplayer(
              minHeight: 60,
              controller: _miniplayerController,
              maxHeight: playerMaxHeight,
              valueNotifier: playerExpandProgress,
              builder: (height, percentage) {
                return VideoPlayScreen(height: height,
                  miniplayerController: _miniplayerController,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: playerExpandProgress,
        builder: (BuildContext context, double height, Widget? child) {
          final value = percentageFromValueInRange(
              min: playerMinHeight, max: playerMaxHeight, value: height);

          var opacity = 1 - value;
          if (opacity < 0) opacity = 0;
          if (opacity > 1) opacity = 1;

          return SizedBox(
            height:
            kBottomNavigationBarHeight - kBottomNavigationBarHeight * value,
            child: Transform.translate(
              offset: Offset(0.0, kBottomNavigationBarHeight * value * 0.5),
              child: Opacity(
                opacity: opacity,
                child: OverflowBox(
                  maxHeight: kBottomNavigationBarHeight,
                  child: child,
                ),
              ),
            ),
          );
        },
        child: SingleChildScrollView(
          child: BottomNavigationBar(
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
        ),
      ),
    );
  }
}


