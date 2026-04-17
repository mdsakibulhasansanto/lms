



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_primary_button.dart';

class AppAuthPrimaryButton extends StatelessWidget {
  const AppAuthPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: PrimaryButton(
        onPressed: onPressed,
        text: label,
        backgroundColor: AppColors.primary500,
        radius: 8.r,
      ),
    );
  }
}