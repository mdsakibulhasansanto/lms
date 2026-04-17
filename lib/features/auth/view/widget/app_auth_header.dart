



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AppAuthHeader extends StatelessWidget {
  const AppAuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}