import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller for bouncy effect
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    // Tween for scale animation with "bounce" curve
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    // Navigate to Login page after 4.5 seconds
    Timer(Duration(milliseconds: 4500), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(color: Color(0xFF48c7bb)),

          // Optional background effect image
          Positioned.fill(
            child: Opacity(
              opacity: 0.2, // subtle effect
              child: Image.asset(
                'assets/images/bg_effect.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Centered logo with bouncy scale animation
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/logo.png',
                width: 1300, // adjust size as needed
                height: 1300,
              ),
            ),
          ),

          // Circular progress indicator at bottom
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
