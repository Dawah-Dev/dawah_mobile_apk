import 'package:flutter/material.dart';
import 'package:dawah_mobile_application/feature/splash%20and%20data%20progress/ui/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = SplashScreen();
    }
    // else if (settings.name == MainScreenBottomNav.name) {
    //   route = MainScreenBottomNav();
    // }
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
