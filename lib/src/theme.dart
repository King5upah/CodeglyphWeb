import 'package:flutter/material.dart';

class CodeglyphTheme {
  final Color backgroundColor;
  final Color headerColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color borderColor;
  final Color accentColor;
  final Color glowColor;

  // Syntax Colors
  final Color stringColor;
  final Color commentColor;
  final Color typeColor;
  final Color numberColor;

  const CodeglyphTheme({
    required this.backgroundColor,
    required this.headerColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.borderColor,
    required this.accentColor,
    required this.glowColor,
    this.stringColor = Colors.green,
    this.commentColor = Colors.grey,
    this.typeColor = Colors.purple,
    this.numberColor = Colors.orange,
  });

  /// A dark, mysterious theme inspired by the stone blocks of the Void Century.
  static const CodeglyphTheme voidCentury = CodeglyphTheme(
    backgroundColor: Color.fromRGBO(20, 20, 26, 1.0), // 0.08, 0.08, 0.1
    headerColor: Color.fromRGBO(31, 31, 38, 1.0),     // 0.12, 0.12, 0.15
    textColor: Color.fromRGBO(230, 230, 242, 1.0),    // 0.9, 0.9, 0.95
    secondaryTextColor: Color.fromRGBO(0, 0, 255, 0.6), // Colors.blue.withOpacity(0.6)
    borderColor: Color.fromRGBO(0, 0, 255, 0.2),      // Colors.blue.withOpacity(0.2)
    accentColor: Color.fromRGBO(102, 153, 255, 1.0),  // Soft Blue
    glowColor: Colors.blue,
    stringColor: Color.fromRGBO(153, 204, 153, 1.0),  // Pale Green
    commentColor: Color.fromRGBO(128, 128, 128, 0.8), // Gray
    typeColor: Color.fromRGBO(204, 153, 255, 1.0),    // Soft Purple
    numberColor: Color.fromRGBO(255, 204, 153, 1.0),  // Soft Orange
  );
}
