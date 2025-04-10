import 'package:dawah_mobile_application/app/app_routes.dart';
import 'package:dawah_mobile_application/app/controller_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DawahApp extends StatelessWidget {
  const DawahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: Colors.blueAccent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueGrey
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white)
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
