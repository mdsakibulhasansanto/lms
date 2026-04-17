import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? email;
  const VerifyOtpScreen({super.key,  this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _pinController = TextEditingController();
  bool _hasError = false;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_pinController.text.length < 4) {
      setState(() => _hasError = true);
      return;
    }
    setState(() => _hasError = false);
    context.pushNamed(AppRouteName.successViewScreen);
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
                  _buildPinField(),
                  SizedBox(height: 16.h),
                  _buildResendRow(),
                  SizedBox(height: 72.h),
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: PrimaryButton(
                      onPressed: _onNextPressed,
                      text: 'Next',
                      backgroundColor: AppColors.primary500,
                      radius: 10.r,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(height: 40.h),
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
          'Verify OTP',
          style: AppTextStyles.publicSans_semiBold_24_center(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Enter the OTP code sent to ${widget.email}',
          style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      controller: _pinController,
      autoDisposeControllers: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      animationDuration: const Duration(milliseconds: 200),
      autoFocus: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        borderWidth: 0.5.w,
        fieldHeight: 50.h,
        fieldWidth: 48.w,
        activeColor: AppColors.primary500,
        inactiveColor: const Color(0xFFE0E0E0),
        selectedColor: AppColors.primary500,
        activeFillColor: Colors.white,
        inactiveFillColor: const Color(0xFFFAFAFA),
        selectedFillColor: Colors.white,
      ),
      enableActiveFill: true,
      cursorColor: AppColors.primary500,
      textStyle: AppTextStyles.publicSans_medium_16(color: AppColors.black),
      onChanged: (value) {
        if (_hasError && value.length == 6) {
          setState(() => _hasError = false);
        }
      },
    );
  }

  Widget _buildResendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive it? Try again  ",
          style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary300),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Resend OTP',
            style: AppTextStyles.publicSans_regular_14_center(color: AppColors.primary500)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}