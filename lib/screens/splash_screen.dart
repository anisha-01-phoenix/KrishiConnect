import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/authentication%20screens/user_details.dart';
import 'package:krishi_connect/screens/dashboard_farmer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import 'authentication screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Retrieve UserModel from SharedPreferences
  Future<UserModel?> getUserModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('userModel');
    if (jsonString != null) {
      return UserModel.fromJson(jsonString);
    } else {
      return null; // Handle the case when there is no stored UserModel
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeData(); // Call async initialization method without awaiting
  }

  Future<void> _initializeData() async {
    // Perform your asynchronous operations here
    // Retrieve user model or other initialization tasks
    final User? _authUser = FirebaseAuth.instance.currentUser;
    final UserModel? userData = await getUserModel();
    await Future.delayed(Duration(seconds: 2));
    // Handle navigation or state changes here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => (_authUser == null)
              ? LoginScreen()
              : (userData == null)
              ? UserDetailsScreen()
              : DashboardFarmer()),
    );
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
