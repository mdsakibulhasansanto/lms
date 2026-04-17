import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? fontSize;
  final double? radius;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isActive;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.radius,
    this.isActive = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary500,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        child: ElevatedButton(
          onPressed: isActive ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
            ),
            elevation: 0,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.publicSans_semiBold_16_center(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}