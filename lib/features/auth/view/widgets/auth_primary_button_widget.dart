import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/widgets/app_primary_button.dart';

class AuthPrimaryButtonWidget extends StatelessWidget {
  const AuthPrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: PrimaryButton(
        onPressed: onPressed,
        text: text,
        backgroundColor: AppColors.primary500,
        radius: 8.r,
      ),
    );
  }
}
