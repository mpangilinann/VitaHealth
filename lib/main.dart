import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/add_to_cart_page.dart';
import 'pages/notification_page.dart';
import 'pages/feedback_page.dart';
import 'pages/profile_page.dart';
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
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(), // points to real LoginPage
        '/dashboard': (context) =>
            DashboardPage(), // points to real DashboardPage
        '/cart': (context) => AddToCartPage(),
        '/notifications': (context) => NotificationPage(),
        '/feedback': (context) => FeedbackPage(),
        '/profile': (context) => ProfilePage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const ErrorPage());
      },
    );
  }
}
