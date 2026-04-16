

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Grey
  static const Color grey100 = Color(0xFFF9FAFB);
  static const Color grey200 = Color(0xFFF4F6F8);
  static const Color grey300 = Color(0xFFDFE3E8);
  static const Color grey400 = Color(0xFFC4CDD5);
  static const Color grey500 = Color(0xFF919EAB);
  static const Color grey600 = Color(0xFF637381);
  static const Color grey700 = Color(0xFF454F5B);
  static const Color grey800 = Color(0xFF212B36);
  static const Color grey900 = Color(0xFF161C24);

  // Primary / Linear Gradient
  static const Color primaryStart = Color(0xFF153885);
  static const Color primaryMiddle = Color(0xFF2563EB);
  static const Color primaryEnd = Color(0xFF153885);

  static const LinearGradient primaryLinear = LinearGradient(
    colors: [primaryStart, primaryMiddle, primaryEnd],
  );
}