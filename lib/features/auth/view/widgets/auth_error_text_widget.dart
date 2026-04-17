import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theme/app_text_styles.dart';

class AuthErrorTextWidget extends StatelessWidget {
  const AuthErrorTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
        SizedBox(width: 4.w),
        Text(
          text,
          style: AppTextStyles.publicSans_regular_14_center(
            color: const Color(0xFFE53935),
          ),
        ),
      ],
    );
  }
}
