import 'package:flutter/material.dart';

class AppTheme {
  // Define the color scheme
  static const Color primaryColor = Color(0xFFaec6cf);
  static const Color secondaryColor = Color(0xFF77dd77);
  static const Color backgroundColor = Color(0xFFd3d3d3);
  static const Color textColor = Color(0xFFa9a9a9);
  static const Color accentColor = Color(0xFFffb3ba);
  static const Color labelColor = Colors.black;
  static Color formtextColor = Colors.grey[600]!;

  // Define the text styles
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: textColor,
  );

  static const TextStyle headerText = TextStyle(
    fontSize: 20.0, // Minimum size
    color: textColor,
  );

  static const TextStyle headerTextLarge = TextStyle(
    fontSize: 24.0, // Maximum size
    color: textColor,
  );

  static const TextStyle secondaryText = TextStyle(
    fontSize: 14.0,
    color: textColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0, // Maximum size
    color: textColor,
  );

  static const TextStyle buttonTextSmall = TextStyle(
    fontSize: 14.0, // Minimum size
    color: textColor,
  );
}
