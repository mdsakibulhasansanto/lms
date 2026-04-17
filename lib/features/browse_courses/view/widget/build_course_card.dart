


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/course_model.dart';

class BuildCourseCard extends StatelessWidget {
  final CourseModel course;
  const BuildCourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius:8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(10.r)),
                child: Image.network(
                  course.imageUrl,
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: AppColors.grey200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary500,
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (course.isFree)
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary500,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'Free',
                      style: AppTextStyles.inter_regular_12(
                          color: AppColors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      course.category,
                      style: AppTextStyles.inter_regular_12(
                          color: AppColors.indigo500
                      ),
                    ),
                    Text(
                      '24 hours',
                      style: AppTextStyles.inter_regular_12(
                          color: AppColors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  course.title,
                  style: AppTextStyles.publicSans_medium_16(
                      color: AppColors.black
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      course.isFree
                          ? 'Free'
                          : '\$${course.price.toStringAsFixed(2)}',
                      style:
                      AppTextStyles.publicSans_semiBold_18_center(
                        color: course.isFree
                            ? AppColors.secondary500
                            : AppColors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded,
                            color: Colors.amber, size: 14.sp),
                        SizedBox(width: 4.w),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${course.rating}',
                                style: AppTextStyles.inter_regular_12(
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' (${course.reviewCount} ',
                                style: AppTextStyles.inter_regular_12(
                                  color: AppColors.grey500,
                                ),
                              ),
                              const TextSpan(
                                text: 'reviews)',
                              ),
                            ],
                            style: AppTextStyles.inter_regular_12(
                              color: AppColors.grey500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
