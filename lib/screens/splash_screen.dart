import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/dashboard.dart';
import 'package:krishi_connect/screens/test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Navigate to HomeScreen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            "assets/images/app_logo.png",
          ),
        ),
      ),
    );
  }
}
