import 'dart:convert';
import 'dart:core';

enum UserType {
  farmer,
  buyer,
}

class UserModel {
  final String name;
  final UserType userType;
  final String aadharNumber;
  final String addressLine;
  final String accountNumber;
  final String ifscCode;
  UserModel(
      {required this.name,
      required this.userType,
      required this.aadharNumber,
      required this.addressLine,
      required this.accountNumber,
      required this.ifscCode});

// Convert UserModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userType': userType.toString(),
      'aadharNumber': aadharNumber,
      'addressLine': addressLine,
      'accountNumber': accountNumber,
      'ifscCode': ifscCode,
    };
  }

  // Convert Map to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      userType:
          UserType.values.firstWhere((e) => e.toString() == map['userType']),
      aadharNumber: map['aadharNumber'],
      addressLine: map['addressLine'],
      accountNumber: map['accountNumber'],
      ifscCode: map['ifscCode'],
    );
  }

  // Convert UserModel to JSON string
  String toJson() => json.encode(toMap());

  // Convert JSON string to UserModel
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
