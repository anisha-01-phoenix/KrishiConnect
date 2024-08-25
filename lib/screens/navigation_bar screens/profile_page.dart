import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

class ProfilePage extends StatelessWidget {
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
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: getUserModel(), // Fetch user model asynchronously
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while waiting
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error message if an error occurs
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found')); // Handle case when there is no data
          } else {
            final UserModel user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${user.name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Type: ${user.userType.toString().split('.').last}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aadhar Number: ${user.aadharNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Address: ${user.addressLine}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Account Number: ${user.accountNumber}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'IFSC Code: ${user.ifscCode}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  // Submit Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        minimumSize: Size(screenWidth*0.8, screenHeight*0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async{

                        await FirebaseAuth.instance.signOut();
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.clear(); // Clear all data from SharedPreferences


                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SplashScreen()),
                        );
                        },
                      child: Text('Log Out', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
