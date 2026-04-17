import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';

class AuthDialogWidget extends StatelessWidget {
  const AuthDialogWidget({
    super.key,
    required this.iconAssetPath,
    required this.title,
    required this.subtitle,
    required this.secondaryButtonText,
    required this.primaryButtonText,
    required this.onSecondaryTap,
    required this.onPrimaryTap,
  });

  final String iconAssetPath;
  final String title;
  final String subtitle;
  final String secondaryButtonText;
  final String primaryButtonText;
  final VoidCallback onSecondaryTap;
  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: const BoxDecoration(
                color: AppColors.primary100,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                iconAssetPath,
                width: 24.w,
                height: 24.w,
                color: AppColors.primary500,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.publicSans_regular_16_center(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: AppTextStyles.publicSans_regular_14_center(
                color: AppColors.primary300,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onSecondaryTap,
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.bordersColore,
                          width: 0.5.w,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          secondaryButtonText,
                          style: AppTextStyles.publicSans_regular_16_center(
                            color: AppColors.primary300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: PrimaryButton(
                      onPressed: onPrimaryTap,
                      text: primaryButtonText,
                      backgroundColor: AppColors.primary500,
                      radius: 8.r,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
