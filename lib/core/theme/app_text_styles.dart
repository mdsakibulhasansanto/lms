import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static const defaultColor = Colors.black;

  // ------------------- Public Sans 24 Medium -------------------
  static TextStyle publicSans_medium_24_center({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    height: 36 / 24,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Public Sans 24 SemiBold -------------------
  static TextStyle publicSans_semiBold_24_center({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    height: 36 / 24,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Public Sans 16 Regular -------------------
  static TextStyle publicSans_regular_16_center({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 24 / 16,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Public Sans 16 Medium -------------------
  static TextStyle publicSans_medium_16({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    height: 1,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Public Sans 14 Regular -------------------
  static TextStyle publicSans_regular_14_center({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 22 / 14,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Public Sans 16 SemiBold -------------------
  static TextStyle publicSans_semiBold_16_center({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.publicSans().fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    height: 26 / 16,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Inter 12 Regular -------------------
  static TextStyle inter_regular_12({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    height: 1,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );

  // ------------------- Roboto 16 Numeric -------------------
  static TextStyle roboto_regular_16_numeric({Color? color}) => TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 20 / 16,
    letterSpacing: 0,
    color: color ?? defaultColor,
    fontFeatures: const [
      FontFeature.tabularFigures(),
      FontFeature.liningFigures(),
    ],
  );

  // ------------------- SF Pro 24 SemiBold -------------------
  static TextStyle sfPro_semiBold_24_center({Color? color}) => TextStyle(
    fontFamily: '.SF Pro Display',
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    height: 1,
    letterSpacing: 0,
    color: color ?? defaultColor,
  );
}