import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      const routes = [
        '/dashboard',
        '/cart',
        '/notifications',
        '/feedback',
        '/profile',
      ];
      final target = routes[index];
      final current = ModalRoute.of(context)?.settings.name;
      if (current != target) {
        Navigator.pushReplacementNamed(context, target);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Reviews Page', style: TextStyle(fontSize: 24))),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
