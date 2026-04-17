



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RoleTile extends StatelessWidget {
  final String assetIcon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleTile({
    required this.assetIcon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary50 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary500 : AppColors.grey300,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.white : AppColors.primary100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Image.asset(
                  assetIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.publicSans_semiBold_16_center(
                      color: AppColors.grey800,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppTextStyles.publicSans_regular_14_center(
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: AppColors.primary500,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}