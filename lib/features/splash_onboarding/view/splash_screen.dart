import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';
import 'package:lms/core/utils/assets_urls.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_provider.dart';
import 'package:lms/features/auth/viewmodel/auth_provider/auth_state.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override

  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    await ref.read(authProvider.notifier).checkAuthStatus();
    if (!mounted) return;
    final status = ref.read(authProvider).status;
    if (status == AuthStatus.authenticated) {
      context.goNamed(AppRouteName.dashboardScreen);
    } else {
      context.goNamed(AppRouteName.firstOnboardingScreen);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryLinear,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage(AssetsUrls.elearning),
                    width: 40.w,
                    height: 40.w,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Ready LMS',
                    style: AppTextStyles.
                    publicSans_semiBold_24_center(color:AppColors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Where Learning Meets Growth',
                style: AppTextStyles.publicSans_regular_16_center(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
