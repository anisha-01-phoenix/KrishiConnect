import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/dashboard_farmer.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedUserType = '-- Select --';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensure the keyboard pushes up content
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your Details",
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 36.0),
                // Name Field
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedUserType,
                    items: <String>['-- Select --', 'Farmer', 'Buyer'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value[0].toUpperCase() + value.substring(1)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedUserType = newValue!;
                      });
                    },
                    iconSize: 0,
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 16),
                // Aadhaar Number Field
                TextFormField(
                  controller: _aadharController,
                  decoration: InputDecoration(
                    labelText: "Aadhaar Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Aadhaar number';
                    } else if (value.length != 12) {
                      return 'Aadhaar number must be 12 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // Address Field
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // Bank Account Number Field
                TextFormField(
                  controller: _accountNumberController,
                  decoration: InputDecoration(
                    labelText: "Bank Account Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bank account number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // IFSC Code Field
                TextFormField(
                  controller: _ifscController,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: "IFSC Code",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bank IFSC code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                // Submit Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(screenWidth*0.8, screenHeight*0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? true) {
                        // If the form is valid, display a snackbar or handle submission
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing and Storing Data')),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardFarmer()),
                        );
                        // Perform the submission or other operations
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
