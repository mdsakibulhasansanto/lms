import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';

import '../widget/country_code_picker.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
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

  void _onSignUpPressed() {
    setState(() {
      _hasFullNameError = _fullNameController.text.trim().isEmpty;
      _hasEmailError = _emailController.text.trim().isEmpty;
      _hasPhoneError = _phoneController.text.trim().isEmpty;
      _hasPasswordError = _passwordController.text.isEmpty;
      _hasTermsError = !_agreedToTerms;
    });

    if (_hasFullNameError || _hasEmailError || _hasPhoneError || _hasPasswordError || _hasTermsError) return;
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
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  _buildTitle(),
                  SizedBox(height: 48.h),
                  _buildTextField(
                    controller: _fullNameController,
                    hint: 'Full name',
                    keyboardType: TextInputType.name,
                    hasError: _hasFullNameError,
                    errorText: 'Full name is required.',
                    onChanged: (_) => setState(() => _hasFullNameError = false),
                  ),
                  SizedBox(height: 20.h),
                  _buildTextField(
                    controller: _emailController,
                    hint: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    hasError: _hasEmailError,
                    errorText: 'Email address is required.',
                    onChanged: (_) => setState(() => _hasEmailError = false),
                  ),
                  SizedBox(height: 20.h),
                  _buildPhoneField(),
                  SizedBox(height: 20.h),
                  _buildPasswordField(),
                  SizedBox(height: 20.h),
                  _buildTermsRow(),
                  Spacer(),
                  PrimaryButton(
                    height: 52.h,
                    onPressed: _onSignUpPressed,
                    text: 'Sign up',
                    backgroundColor: AppColors.primary500,
                    radius: 8.r,
                  ),
                  const Spacer(),
                  _buildSignInRow(),
                  SizedBox(height: 102.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Sign Up',
      style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool hasError = false,
    String? errorText,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: hasError ? const Color(0xFFE53935) : AppColors.bordersColore,
              width: hasError ? 1.w : 0.5.w,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged ?? (_) => setState(() {}),
            style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.publicSans_regular_16_center(color: AppColors.hintColore),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              border: InputBorder.none,
              isCollapsed: true,
            ),
          ),
        ),
        if (hasError && errorText != null) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
              SizedBox(width: 4.w),
              Text(
                errorText,
                style: AppTextStyles.publicSans_regular_14_center(color: const Color(0xFFE53935)),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountryCodePicker(
              selectedCountry: _selectedCountry,
              onChanged: (c) => setState(() => _selectedCountry = c),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: _hasPhoneError ? const Color(0xFFE53935) : AppColors.bordersColore,
                    width: _hasPhoneError ? 1.w : 0.5.w,
                  ),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (_) => setState(() => _hasPhoneError = false),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
                  decoration: InputDecoration(
                    hintText: '0000000000',
                    hintStyle: AppTextStyles.publicSans_regular_16_center(color: AppColors.hintColore),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_hasPhoneError) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
              SizedBox(width: 4.w),
              Text(
                'Phone number is required.',
                style: AppTextStyles.publicSans_regular_14_center(color: const Color(0xFFE53935)),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: _hasPasswordError ? const Color(0xFFE53935) : AppColors.bordersColore,
              width: _hasPasswordError ? 1.w : 0.5.w,
            ),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            onChanged: (_) => setState(() => _hasPasswordError = false),
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
        ),
        if (_hasPasswordError) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
              SizedBox(width: 4.w),
              Text(
                'Password is required.',
                style: AppTextStyles.publicSans_regular_14_center(color: const Color(0xFFE53935)),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildTermsRow() {
    return Column(
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
                  color: _hasTermsError ? const Color(0xFFE53935) : AppColors.grey400,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.publicSans_regular_14_center(color: AppColors.grey600),
                  children: [
                    const TextSpan(text: "By registering, I confirm that I accept ShowMe's "),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary500)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    const TextSpan(text: ', and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary500)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (_hasTermsError) ...[
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.error_outline, color: const Color(0xFFE53935), size: 14.w),
              SizedBox(width: 4.w),
              Text(
                'You must accept the terms to continue.',
                style: AppTextStyles.publicSans_regular_14_center(color: const Color(0xFFE53935)),
              ),
            ],
          ),
        ],
        SizedBox(height: 10.h,)
      ],
    );
  }

  Widget _buildSignInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary300),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Sign In',
            style: AppTextStyles.publicSans_regular_16_center(color: AppColors.primary500),
          ),
        ),
      ],
    );
  }
}