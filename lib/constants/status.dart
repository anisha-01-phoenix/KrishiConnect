// Function to get color based on status
import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'verified':
      return Colors.green;
    case 'pending':
      return Colors.orange;
    case 'listed':
      return Colors.blue;
    case 'sold':
      return Colors.red;
    default:
      return Colors.grey;
  }
}