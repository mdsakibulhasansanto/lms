import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.hasError = false,
    this.suffixIcon,
    this.borderRadius = 8,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool hasError;
  final Widget? suffixIcon;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: Border.all(
          color: hasError ? const Color(0xFFE53935) : AppColors.bordersColore,
          width: hasError ? 1.w : 0.5.w,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: AppTextStyles.publicSans_regular_16_center(
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.publicSans_regular_16_center(
            color: AppColors.hintColore,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 14.h,
          ),
          border: InputBorder.none,
          isCollapsed: true,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
