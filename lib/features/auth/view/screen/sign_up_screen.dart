import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';
import '../../../../core/utils/assets_urls.dart';
import '../widgets/app_or_divider.dart';
import '../widgets/app_skip_button.dart';
import '../widgets/auth_auth_switch_row_widget.dart';
import '../widgets/auth_primary_button_widget.dart';
import '../widgets/auth_social_button_widget.dart';
import '../widgets/auth_title_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  const AuthTitleWidget(
                    title: 'Welcome Back!',
                    subtitle: 'Hello there, how would you like to continue',
                  ),
                  SizedBox(height: 40.h),
                  AuthSocialButtonWidget(
                    onTap: () {},
                    icon: Image.asset(
                      AssetsUrls.google,
                      width: 22.w,
                      height: 22.w,
                    ),
                    text: 'Continue with Google',
                  ),
                  SizedBox(height: 12.h),
                  AuthSocialButtonWidget(
                    onTap: () {},
                    icon: Image.asset(
                      AssetsUrls.apple,
                      width: 22.w,
                      height: 22.w,
                    ),
                    text: 'Continue with Apple',
                  ),
                  SizedBox(height: 20.h),
                  const AppOrDivider(),
                  SizedBox(height: 20.h),
                  AuthPrimaryButtonWidget(
                    onPressed: () {
                      context.pushNamed(AppRouteName.signUpEmailScreen);
                    },
                    text: 'Sign up with Email',
                  ),
                  const Spacer(),
                  AuthAuthSwitchRowWidget(
                    questionText: "Don't have an account? ",
                    actionText: 'Sign Up',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 92.h),
                ],
              ),
            ),
            Positioned(top: 12.h, right: 16.w, child: AppSkipButton()),
          ],
        ),
      ),
    );
  }
}
