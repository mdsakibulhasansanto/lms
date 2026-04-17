import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';

import '../../../../core/utils/assets_urls.dart';
import '../widget/app_auth_bottom_row.dart';
import '../widget/app_auth_header.dart';
import '../widget/app_auth_primary_button.dart';
import '../widget/app_or_divider.dart';
import '../widget/app_skip_button.dart';
import '../widget/app_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Image.asset(
                    AssetsUrls.elearning,
                    width: 80.w,
                    height: 80.h,
                    color: AppColors.primary500,
                  ),
                  SizedBox(height: 24.h),
                  const AppAuthHeader(
                    title: 'Welcome Back!',
                    subtitle: 'Hello there, how would you like to continue',
                  ),
                  SizedBox(height: 40.h),
                  AppSocialButton(
                    onTap: () {},
                    icon: Image.asset(AssetsUrls.google, width: 22.w, height: 22.w),
                    label: 'Continue with Google',
                  ),
                  SizedBox(height: 12.h),
                  AppSocialButton(
                    onTap: () {},
                    icon: Image.asset(AssetsUrls.apple, width: 22.w, height: 22.w),
                    label: 'Continue with Apple',
                  ),
                  SizedBox(height: 24.h),
                  const AppOrDivider(),
                  SizedBox(height: 24.h),
                  AppAuthPrimaryButton(
                    onPressed: () {
                      context.pushNamed(AppRouteName.loginEmailScreen);
                    },
                    label: 'Login with Email',
                  ),
                  const Spacer(),
                  AppAuthBottomRow(
                    questionText: "Don't have an account? ",
                    actionText: 'Sign Up',
                    onTap: () {
                     context.pushNamed(AppRouteName.signUpScreen);
                    },
                  ),
                  SizedBox(height: 92.h),
                ],
              ),
            ),
            Positioned(
              top: 12.h,
              right: 16.w,
              child:  AppSkipButton(),
            ),
          ],
        ),
      ),
    );
  }
}









