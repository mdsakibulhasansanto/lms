import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_provider.dart';
import '../widgets/auth_auth_switch_row_widget.dart';
import '../widgets/auth_error_text_widget.dart';
import '../widgets/auth_primary_button_widget.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/auth_title_widget.dart';
import '../widgets/country_code_picker.dart';

class SignUpEmailScreen extends ConsumerStatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  ConsumerState<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends ConsumerState<SignUpEmailScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreedToTerms = false;
  Country _selectedCountry = countries.first;

  bool _hasFullNameError = false;
  bool _hasEmailError = false;
  bool _hasPhoneError = false;
  bool _hasPasswordError = false;
  bool _hasTermsError = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() async {
    setState(() {
      _hasFullNameError = _fullNameController.text.trim().isEmpty;
      _hasEmailError = _emailController.text.trim().isEmpty;
      _hasPhoneError = _phoneController.text.trim().isEmpty;
      _hasPasswordError = _passwordController.text.isEmpty;
      _hasTermsError = !_agreedToTerms;
    });

    if (_hasFullNameError ||
        _hasEmailError ||
        _hasPhoneError ||
        _hasPasswordError ||
        _hasTermsError)
      return;

    final success = await ref
        .read(authProvider.notifier)
        .register(
          name: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          password: _passwordController.text,
        );

    if (!mounted) return;

    if (success) {
      context.pushNamed(AppRouteName.verifyOtpScreen);
    } else {
      final error = ref.read(authProvider).error ?? '';
      if (error.contains('email_already_exists')) {
        setState(() => _hasEmailError = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
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
                  SizedBox(height: 70.h),
                  const AuthTitleWidget(title: 'Sign Up'),
                  SizedBox(height: 48.h),
                  AuthTextFieldWidget(
                    controller: _fullNameController,
                    hintText: 'Full name',
                    keyboardType: TextInputType.name,
                    hasError: _hasFullNameError,
                    onChanged: (_) => setState(() => _hasFullNameError = false),
                  ),
                  if (_hasFullNameError) ...[
                    SizedBox(height: 4.h),
                    const AuthErrorTextWidget(text: 'Full name is required.'),
                  ],
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _emailController,
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    hasError: _hasEmailError,
                    onChanged: (_) => setState(() => _hasEmailError = false),
                  ),
                  if (_hasEmailError) ...[
                    SizedBox(height: 4.h),
                    const AuthErrorTextWidget(
                      text: 'Email address is required.',
                    ),
                  ],
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CountryCodePicker(
                            selectedCountry: _selectedCountry,
                            onChanged: (c) =>
                                setState(() => _selectedCountry = c),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: AuthTextFieldWidget(
                              controller: _phoneController,
                              hintText: '0000000000',
                              keyboardType: TextInputType.phone,
                              hasError: _hasPhoneError,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (_) =>
                                  setState(() => _hasPhoneError = false),
                            ),
                          ),
                        ],
                      ),
                      if (_hasPhoneError) ...[
                        SizedBox(height: 4.h),
                        const AuthErrorTextWidget(
                          text: 'Phone number is required.',
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AuthTextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: _obscurePassword,
                    hasError: _hasPasswordError,
                    onChanged: (_) => setState(() => _hasPasswordError = false),
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.primary300,
                        size: 20.w,
                      ),
                    ),
                  ),
                  if (_hasPasswordError) ...[
                    SizedBox(height: 4.h),
                    const AuthErrorTextWidget(text: 'Password is required.'),
                  ],
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Checkbox(
                              value: _agreedToTerms,
                              onChanged: (val) => setState(() {
                                _agreedToTerms = val ?? false;
                                _hasTermsError = false;
                              }),
                              activeColor: AppColors.primary500,
                              side: BorderSide(
                                color: _hasTermsError
                                    ? const Color(0xFFE53935)
                                    : AppColors.grey400,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style:
                                    AppTextStyles.publicSans_regular_14_center(
                                      color: AppColors.grey600,
                                    ),
                                children: [
                                  const TextSpan(
                                    text:
                                        "By registering, I confirm that I accept ShowMe's ",
                                  ),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style:
                                        AppTextStyles.publicSans_regular_14_center(
                                          color: AppColors.primary500,
                                        ).copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                  const TextSpan(text: ', and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style:
                                        AppTextStyles.publicSans_regular_14_center(
                                          color: AppColors.primary500,
                                        ).copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_hasTermsError) ...[
                        SizedBox(height: 4.h),
                        const AuthErrorTextWidget(
                          text: 'You must accept the terms to continue.',
                        ),
                      ],
                      SizedBox(height: 10.h),
                    ],
                  ),
                  Spacer(),
                  AuthPrimaryButtonWidget(
                    onPressed: _onSignUpPressed,
                    text: 'Sign up',
                  ),
                  const Spacer(),
                  AuthAuthSwitchRowWidget(
                    questionText: 'Already have an account? ',
                    actionText: 'Sign In',
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 102.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
