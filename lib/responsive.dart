import 'package:flutter/material.dart';

class Responsive {
  static bool isMobilePortrait(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return width < height;
  }

  static bool isMobileLandscape(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return width > height;
  }
}
