import 'package:flutter/material.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';

class AuthAuthSwitchRowWidget extends StatelessWidget {
  const AuthAuthSwitchRowWidget({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTap,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: AppTextStyles.publicSans_regular_16_center(
            color: AppColors.primary300,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.publicSans_regular_16_center(
              color: AppColors.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
