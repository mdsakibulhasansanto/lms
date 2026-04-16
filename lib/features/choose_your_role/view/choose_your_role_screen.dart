import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/assets_urls.dart';
import 'package:lms/core/widgets/app_primary_button.dart';
import 'package:lms/features/auth/view/screen/login_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

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
              _RoleTile(
                assetIcon: AssetsUrls.book,
                title: 'Student',
                subtitle: 'Browse courses, learn new skills',
                isSelected: _selectedRole == 'student',
                onTap: () => setState(() => _selectedRole = 'student'),
              ),
              SizedBox(height: 12.h),
              _RoleTile(
                assetIcon: AssetsUrls.teacher,
                title: 'Instructor',
                subtitle: 'Create courses, teach students, and earn',
                isSelected: _selectedRole == 'instructor',
                onTap: () => setState(() => _selectedRole = 'instructor'),
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {},
                text: 'Continue',
                isActive: isActive,
              ),
              SizedBox(height: 4.h),
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
                      color: AppColors.grey600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              /*Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppTextStyles.publicSans_regular_14_center(
                      color: AppColors.grey500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: AppTextStyles.publicSans_semiBold_16_center(
                          color: AppColors.primary500,
                        ).copyWith(
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary500,
                        ),
                        recognizer: _logInRecognizer,
                      ),
                    ],
                  ),
                ),
              ),*/
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade500,
                    ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  final String assetIcon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleTile({
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary50 : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary500 : AppColors.grey300,
            width: 1.5,
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



class LoginFooterText extends StatelessWidget {
  const LoginFooterText({
    super.key,
    required this.onLoginTap,
  });

  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade500,
          ),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: InkWell(
                onTap: onLoginTap,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}