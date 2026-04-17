import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';
import 'package:lms/features/auth/view/screen/sign_up_screen.dart';

import '../../../../core/utils/assets_urls.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _hasPasswordError = false;
  bool _hasEmailError = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _hasEmailError = email.isEmpty;
      _hasPasswordError = email.isNotEmpty && password.isEmpty;
    });

    if (email.isEmpty) return;

    if (password.isEmpty) {
      _showNoAccountDialog();
    }
  }

  void _showNoAccountDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (_) => _buildNoAccountDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  _buildTitle(),
                  SizedBox(height: 40.h),
                  _buildEmailField(),
                  SizedBox(height: 16.h),
                  _buildPasswordField(),
                  SizedBox(height: 10.h),
                  _buildErrorAndForgot(),
                  SizedBox(height: 64.h),
                  _buildLoginButton(),
                  SizedBox(height: 12.h),
                  _buildGoogleButton(),
                  const Spacer(),
                  _buildSignUpRow(),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Log in With Email',
          style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Hello there, log in with your information',
          style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: _hasEmailError ? const Color(0xFFE53935) : AppColors.bordersColore,
          width: _hasEmailError ? 1.w : 0.5.w,
        ),
      ),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        onChanged: (_) {
          if (_hasEmailError) setState(() => _hasEmailError = false);
        },
        style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
        decoration: InputDecoration(
          hintText: 'Email address',
          hintStyle: AppTextStyles.publicSans_regular_16_center(color: AppColors.hintColore),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: InputBorder.none,
          isCollapsed: true,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _hasPasswordError ? const Color(0xFFE53935) : AppColors.bordersColore,
          width: _hasPasswordError ? 1.w : 0.5.w,
        ),
      ),
      child: TextField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        onChanged: (_) {
          if (_hasPasswordError) setState(() => _hasPasswordError = false);
        },
        style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: AppTextStyles.publicSans_regular_16_center(color: AppColors.hintColore),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: InputBorder.none,
          isCollapsed: true,
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscurePassword = !_obscurePassword),
            child: Icon(
              _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: AppColors.primary300,
              size: 20.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorAndForgot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_hasEmailError)
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  "Email address is required.",
                  style: AppTextStyles.publicSans_regular_14_center(
                    color: const Color(0xFFE53935),
                  ),
                ),
              ],
            ),
          ),
        if (_hasPasswordError)
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  "The password you've entered is incorrect.",
                  style: AppTextStyles.publicSans_regular_14_center(
                    color: const Color(0xFFE53935),
                  ),
                ),
              ],
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot password?',
              style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: PrimaryButton(
        onPressed: _onLoginPressed,
        text: 'Log In',
        backgroundColor: AppColors.primary500,
        radius: 8.r,
      ),
    );
  }

  Widget _buildGoogleButton() {
    return GestureDetector(
      onTap: () {},
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
            SizedBox(
              width: 22.w,
              height: 22.w,
              child: Image.asset(AssetsUrls.google, width: 22.w, height: 22.w),
            ),
            SizedBox(width: 10.w),
            Text(
              'Continue with Google',
              style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpRow() {
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

  Widget _buildNoAccountDialog() {
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
              decoration: BoxDecoration(
                color: AppColors.primary100,
                shape: BoxShape.circle,
              ),
              child: Image.asset(AssetsUrls.elearning, width: 24.w, height: 24.w,color: AppColors.primary500,)
            ),
            SizedBox(height: 20.h),
            Text(
              'Sorry, there is no account\nwith this email.',
              textAlign: TextAlign.center,
              style: AppTextStyles.publicSans_regular_16_center(
                color: const Color(0xFFE53935),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Create an account to continue',
              style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.bordersColore, width: 0.5.w),
                      ),
                      child: Center(
                        child: Text(
                          'Back',
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
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        );
                      },
                      text: 'Create Account',
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