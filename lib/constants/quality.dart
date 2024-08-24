// Function to build quality stars
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> buildQualityStars(String quality) {
  int starCount;
  switch (quality.toUpperCase()) {
    case 'A+':
      starCount = 5;
      break;
    case 'A':
      starCount = 4;
      break;
    case 'B':
      starCount = 3;
      break;
    case 'C':
      starCount = 2;
      break;
    case 'D':
      starCount = 1;
      break;
    default:
      starCount = 0;
  }
  return List.generate(
      starCount, (index) => Icon(Icons.star, color: Colors.amber));
}