import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/utils/assets_urls.dart';

class FirstOnboardingScreen extends StatefulWidget {
  const FirstOnboardingScreen({super.key});

  @override
  State<FirstOnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': AssetsUrls.elearning_onboarding_a,
      'title': 'Discover Top Courses',
      'subtitle': 'Explore thousands of browse_courses from\nexpert instructors',
    },
    {
      'image': AssetsUrls.elearning_onboarding_b,
      'title': 'Learn Anytime, Anywhere',
      'subtitle': 'Access lessons on your schedule\nand track your progress',
    },
    {
      'image': AssetsUrls.elearning_onboarding_a,
      'title': 'Teach & Share Your Knowledge',
      'subtitle':
      'Create browse_courses, reach students, and earn from your expertise',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        right: false,
        left: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.pushNamed(AppRouteName.choiceYourRoleScreen);
                  },
                  borderRadius: BorderRadius.circular(90.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary100,
                      borderRadius: BorderRadius.circular(90.r),
                    ),
                    child: Text(
                      'Skip',
                      style: AppTextStyles.publicSans_medium_16(
                        color: AppColors.primary500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _slides[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          _slides[index]['title']!,
                          style: AppTextStyles.publicSans_medium_24_center(
                            color: AppColors.primary500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          _slides[index]['subtitle']!,
                          style: AppTextStyles.publicSans_regular_16_center(
                            color: AppColors.grey500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_slides.length, (index) {
                        return Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: _currentPage == index ? 24.w : 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? AppColors.primary500
                                    : AppColors.grey300,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            if (index != _slides.length - 1) SizedBox(width: 6.w),
                          ],
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_currentPage < _slides.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          context.pushNamed(AppRouteName.choiceYourRoleScreen);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary500,
                            width: 1,
                          ),
                        ),
                        child: Container(
                          width: 42.w,
                          height: 42.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary500,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}