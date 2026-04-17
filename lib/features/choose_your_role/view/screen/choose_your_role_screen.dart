import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/utils/assets_urls.dart';
import 'package:lms/core/widgets/app_primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widget/role_tile.dart';

class ChooseYourRoleScreen extends StatefulWidget {
  const ChooseYourRoleScreen({super.key});

  @override
  State<ChooseYourRoleScreen> createState() => _ChooseYourRoleScreenState();
}

class _ChooseYourRoleScreenState extends State<ChooseYourRoleScreen> {
  String? _selectedRole;
  late final TapGestureRecognizer _logInRecognizer;

  @override
  void initState() {
    super.initState();
    _logInRecognizer = TapGestureRecognizer()..onTap = () {};
  }

  @override
  void dispose() {
    _logInRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = _selectedRole != null;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  'Choose Your Role',
                  style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
                ),
              ),
              SizedBox(height: 48.h),
              Text(
                'Select how you want to use the app',
                style: AppTextStyles.publicSans_regular_14_center(
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 12.h),
              RoleTile(
                assetIcon: AssetsUrls.book,
                title: 'Student',
                subtitle: 'Browse browse_courses, learn new skills',
                isSelected: _selectedRole == 'student',
                onTap: () => setState(() => _selectedRole = 'student'),
              ),
              SizedBox(height: 12.h),
              RoleTile(
                assetIcon: AssetsUrls.teacher,
                title: 'Instructor',
                subtitle: 'Create browse_courses, teach students, and earn',
                isSelected: _selectedRole == 'instructor',
                onTap: () => setState(() => _selectedRole = 'instructor'),
              ),
              const Spacer(),

              PrimaryButton(
                  onPressed: isActive ? () {
                    context.pushNamed(AppRouteName.signUpScreen);
                  } : null,
                  text: 'Continue', isActive: isActive,
                  width: double.infinity, height: 52.h,
                  radius: 8.r,
                  backgroundColor: isActive ? AppColors.primary500 : const Color(0xFFB1D7FF),
                  textColor: AppColors.white
              ),
              SizedBox(height: 16.h),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  child: Text(
                    'Decide later',
                    style: AppTextStyles.publicSans_medium_16(
                      color: AppColors.grey500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 78.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary300),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(AppRouteName.loginScreen);
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Log In',
                              style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
    );
  }
}



