import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/features/auth/view/screen/sign_up_screen.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_provider.dart';

import '../../../../core/utils/assets_urls.dart';
import '../widgets/auth_auth_switch_row_widget.dart';
import '../widgets/auth_dialog_widget.dart';
import '../widgets/auth_error_text_widget.dart';
import '../widgets/auth_forgot_password_widget.dart';
import '../widgets/auth_primary_button_widget.dart';
import '../widgets/auth_social_button_widget.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/auth_title_widget.dart';

class LoginEmailScreen extends ConsumerStatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  ConsumerState<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends ConsumerState<LoginEmailScreen> {
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

  void _onLoginPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _hasEmailError = email.isEmpty;
      _hasPasswordError = false;
    });

    if (email.isEmpty) return;
    if (password.isEmpty) {
      setState(() => _hasPasswordError = true);
      return;
    }

    final success = await ref
        .read(authProvider.notifier)
        .login(email: email, password: password);

    if (!mounted) return;

    if (success) {
      context.goNamed(AppRouteName.browseCoursesScreen);
    } else {
      final error = ref.read(authProvider).error ?? '';
      if (error.contains('user_not_found')) {
        _showNoAccountDialog();
      } else if (error.contains('wrong_password')) {
        setState(() => _hasPasswordError = true);
      }
    }
  }

  void _showNoAccountDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (_) => AuthDialogWidget(
        iconAssetPath: AssetsUrls.elearning,
        title: 'Sorry, there is no account\nwith this email.',
        subtitle: 'Create an account to continue',
        secondaryButtonText: 'Back',
        primaryButtonText: 'Create Account',
        onSecondaryTap: () => Navigator.pop(context),
        onPrimaryTap: () {
          context.pushNamed(AppRouteName.signUpScreen);
        },
      ),
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
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  const AuthTitleWidget(
                    title: 'Log in With Email',
                    subtitle: 'Hello there, log in with your information',
                  ),
                  SizedBox(height: 40.h),
                  AuthTextFieldWidget(
                    controller: _emailController,
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    hasError: _hasEmailError,
                    onChanged: (_) {
                      if (_hasEmailError) {
                        setState(() => _hasEmailError = false);
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  AuthTextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: _obscurePassword,
                    hasError: _hasPasswordError,
                    borderRadius: 12,
                    onChanged: (_) {
                      if (_hasPasswordError) {
                        setState(() => _hasPasswordError = false);
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF5E6470),
                        size: 20.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (_hasEmailError)
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: const AuthErrorTextWidget(
                            text: 'Email address is required.',
                          ),
                        ),
                      if (_hasPasswordError)
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: const AuthErrorTextWidget(
                            text: "The password you've entered is incorrect.",
                          ),
                        ),
                      AuthForgotPasswordWidget(
                        text: 'Forgot password?',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 64.h),
                  AuthPrimaryButtonWidget(
                    onPressed: _onLoginPressed,
                    text: 'Log In',
                  ),
                  SizedBox(height: 12.h),
                  AuthSocialButtonWidget(
                    onTap: () {},
                    icon: Image.asset(
                      AssetsUrls.google,
                      width: 22.w,
                      height: 22.w,
                    ),
                    text: 'Continue with Google',
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
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
