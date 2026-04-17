import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';

import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/widgets/app_primary_button.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_provider.dart';

class SuccessViewScreen extends ConsumerWidget {
  const SuccessViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                width: 68.w,
                height: 68.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary500,
                    width: 3.w,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.secondary500,
                  size: 40.w,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'Verification Success!',
                style: AppTextStyles.publicSans_medium_18(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Your account has been verified',
                style: AppTextStyles.publicSans_medium_16(color: AppColors.primary300),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              PrimaryButton(
                height: 52.h,
                onPressed: () async {
                  await ref.read(authProvider.notifier).confirmSession();
                  if (context.mounted) {
                    context.goNamed(AppRouteName.dashboardScreen);
                  }
                },
                text: 'Go to Home',
                backgroundColor: AppColors.primary500,
                radius: 10.r,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}