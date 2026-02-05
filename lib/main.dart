import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/error_page.dart';

void main() {
  runApp(VitaHealthApp());
}

class VitaHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaHealth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF48c7bb)),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(), // points to real LoginPage
        '/dashboard': (context) =>
            DashboardPage(), // points to real DashboardPage
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const ErrorPage());
      },
    );
  }
}
