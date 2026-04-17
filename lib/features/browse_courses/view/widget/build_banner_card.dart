



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildBannerCard extends StatelessWidget {
  const BuildBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            colors: [Color(0xFF7B2FF7), Color(0xFFAA5FFA)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: ClipRRect(
                borderRadius:
                BorderRadius.horizontal(right: Radius.circular(12.r)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=300&q=80',
                  width: 120.w,
                  fit: BoxFit.cover,
                  color: Colors.purple.withValues(alpha: 0.3),
                  colorBlendMode: BlendMode.srcOver,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Discounted Courses',
                      style: AppTextStyles.publicSans_semiBold_18_center(
                          color: AppColors.white)
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Discount 30% for the first\npurchases',
                    style: AppTextStyles.inter_regular_12(
                        color: AppColors.white),
                  ),
                  SizedBox(height: 10.h),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      elevation: 4,
                      shadowColor: AppColors.black.withValues( alpha: 0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        'Purchase Now',
                        style: AppTextStyles.inter_regular_12(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
