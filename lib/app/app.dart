import 'package:dawah_mobile_application/app/app_routes.dart';
import 'package:flutter/material.dart';

class DawahApp extends StatelessWidget {
  const DawahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: Colors.blueAccent,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white)
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
