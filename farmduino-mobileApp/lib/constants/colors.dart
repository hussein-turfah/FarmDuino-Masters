import 'package:farmduino/constants/variables.dart';
import 'package:flutter/material.dart';

class CustomColors {
  static const mainPurpule = Color.fromARGB(255, 141, 66, 239);
  static const darkerMainPurple = Color.fromARGB(255, 88, 42, 148);
  static const lighterMainPurple = Color.fromARGB(255, 165, 110, 236);
  static const detailsColor = Color.fromARGB(255, 71, 132, 255);
  // Color.fromARGB(255, 249, 226, 175);
  // Color.fromARGB(255, 251, 37, 118);

  static const cardColor = Color.fromARGB(255, 248, 248, 248);
  static final pageBackgroundColor = (!Variables.isDarkTheme)
      ? const Color.fromARGB(255, 240, 243, 245)
      : const Color.fromARGB(255, 18, 18, 18);
}
