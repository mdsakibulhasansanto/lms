




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AppSkipButton extends StatelessWidget {
  const AppSkipButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, right: 16.w, bottom: 4.h, left: 16.w),
        child: Container(
          height: 32.h,
          width: 66.w,
          decoration: BoxDecoration(
            color: AppColors.primary100,
            borderRadius: BorderRadius.circular(48.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Skip',
              style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary500),
            ),
          ),
        ),
      ),
    );
  }
}