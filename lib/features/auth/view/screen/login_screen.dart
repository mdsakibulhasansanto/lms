import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';
import 'package:lms/features/auth/view/screen/sign_up_screen.dart';

import '../../../../core/utils/assets_urls.dart';

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
                  _buildTitle(),
                  SizedBox(height: 40.h),
                  _buildGoogleButton(),
                  SizedBox(height: 12.h),
                  _buildAppleButton(),
                  SizedBox(height: 20.h),
                  _buildOrDivider(),
                  SizedBox(height: 20.h),
                  _buildEmailButton(context),
                  const Spacer(),
                  _buildSignUpRow(context),
                  SizedBox(height: 92.h),
                ],
              ),
            ),
            Positioned(
              top: 12.h,
              right: 16.w,
              child: _buildSkipButton(context),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
        ),
        SizedBox(height: 8.h),
        Text(
          'Hello there, how would you like to continue',
          style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return _socialButton(
      onTap: () {},
      icon: Image.asset(AssetsUrls.google, width: 22.w, height: 22.w),
      label: 'Continue with Google',
    );
  }

  Widget _buildAppleButton() {
    return _socialButton(
      onTap: () {},
      icon: Image.asset(AssetsUrls.apple, width: 22.w, height: 22.w),
      label: 'Continue with Apple',
    );
  }

  Widget _socialButton({
    required VoidCallback onTap,
    required Widget icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.bordersColore, width: 0.5.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 22.w, height: 22.w, child: icon),
            SizedBox(width: 10.w),
            Text(
              label,
              style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDFE3E8), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'Or',
            style: AppTextStyles.publicSans_medium_16(color: const Color(0xFF777777)),
          ),
        ),
        Expanded(child: Divider(color: const Color(0xFFDFE3E8), thickness: 1)),
      ],
    );
  }

  Widget _buildEmailButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: PrimaryButton(
          onPressed: (){
            context.pushNamed(AppRouteName.loginEmailScreen);
          },
          text: 'Login with Email',
          backgroundColor: AppColors.primary500,
        radius: 8.r,
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:  EdgeInsets.only(top: 4.h,right: 16.w,bottom: 4.h,left: 16.w),
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

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary300),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignUpScreen()),
            );
          },
          child: Text(
            'Sign Up',
            style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary500),
          ),
        ),
      ],
    );
  }
}

