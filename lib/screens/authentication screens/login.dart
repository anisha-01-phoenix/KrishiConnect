import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:krishi_connect/screens/authentication%20screens/add_details.dart';
import 'package:krishi_connect/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _verificationId = '';
  bool _isOtpSent = false;

  @override
  Widget build(BuildContext context) {

    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;

    String title = 'Enter your Phone Number';
    String sub_title = 'We will send you the 6 digit code';
    if (_isOtpSent) {
      title = 'Enter the received OTP';
      sub_title = 'We will verify the code for authentication';
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 84.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 250,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              sub_title,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            if (!_isOtpSent)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    prefixText: '+91 ',
                  ),
                ),
              ),
            if (_isOtpSent)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOtpField(_otpController1, null, _focusNode1, _focusNode2),
                  _buildOtpField(_otpController2, _focusNode1, _focusNode2, _focusNode3),
                  _buildOtpField(_otpController3, _focusNode2, _focusNode3, _focusNode4),
                  _buildOtpField(_otpController4, _focusNode3, _focusNode4, _focusNode5),
                  _buildOtpField(_otpController5, _focusNode4, _focusNode5, _focusNode6),
                  _buildOtpField(_otpController6, _focusNode5, _focusNode6, null),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(screen_width*0.8, screen_height*0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _isOtpSent ? _verifyOtp : _sendOtp,
              child: Text(_isOtpSent ? 'Verify OTP' : 'Send OTP', style: TextStyle(color: Colors.white, fontSize: 16.0),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendOtp() async {
    FocusScope.of(context).unfocus();
    String phoneNumber = '+91${_phoneController.text.trim()}';

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _showMessage('Phone number automatically verified and user signed in.');
      },
      verificationFailed: (FirebaseAuthException e) {
        _showMessage('Failed to verify phone number: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _isOtpSent = true;
        });
        _showMessage('OTP sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOtp() async {
    FocusScope.of(context).unfocus();
    String otp = _otpController1.text.trim() +
        _otpController2.text.trim() +
        _otpController3.text.trim() +
        _otpController4.text.trim() +
        _otpController5.text.trim() +
        _otpController6.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      _showMessage('Successfully signed in with phone number.');
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AddDetailsScreen()),
        );
      }
    } catch (e) {
      _showMessage('Failed to sign in: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildOtpField(TextEditingController controller,
      FocusNode? prevFocus, FocusNode currentFocus, FocusNode? nextFocus) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            // Move to the next focus field
            FocusScope.of(context).requestFocus(nextFocus);
          }else if(value.isEmpty && prevFocus != null){
            FocusScope.of(context).requestFocus(prevFocus);
          }
        },
      ),
    );
  }
}
