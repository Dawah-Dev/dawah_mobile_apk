import 'package:dawah_mobile_application/feature/common/ui/screens/main_bottom_navigation_screen.dart';
import 'package:dawah_mobile_application/feature/first%20time%20channel%20connection/ui/screens/first_time_channel_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:dawah_mobile_application/feature/splash%20and%20data%20progress/ui/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = SplashScreen();
    }
    else if (settings.name == FirstTimeChannelConnectionScreen.name) {
      route = FirstTimeChannelConnectionScreen();
    }
    else if (settings.name == MainBottomNavigationScreen.name) {
      route = MainBottomNavigationScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
