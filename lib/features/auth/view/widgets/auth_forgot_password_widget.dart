import 'package:flutter/material.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';

class AuthForgotPasswordWidget extends StatelessWidget {
  const AuthForgotPasswordWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: AppTextStyles.publicSans_regular_14_center(
            color: AppColors.primary300,
          ),
        ),
      ),
    );
  }
}
