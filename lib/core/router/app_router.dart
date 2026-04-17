import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/router/app_route_path.dart';
import 'package:lms/features/auth/view/screen/login_email_screen.dart';
import 'package:lms/features/auth/view/screen/login_screen.dart';
import 'package:lms/features/auth/view/screen/sign_up_email_screen.dart';
import 'package:lms/features/auth/view/screen/sign_up_screen.dart';
import 'package:lms/features/auth/view/screen/success_view_screen.dart';
import 'package:lms/features/auth/view/screen/verify_otp_screen.dart';
import 'package:lms/features/browse_courses/view/screen/home_screen.dart';
import 'package:lms/features/dashboard/view/dashboard_screen.dart';
import 'package:lms/features/splash_onboarding/view/onboarding_screen.dart';
import 'package:lms/features/splash_onboarding/view/splash_screen.dart';
import '../../features/choose_your_role/view/screen/choose_your_role_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutePath.splash,
    routes: [
      GoRoute(
        path: AppRoutePath.splash,
        name: AppRouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutePath.firstOnboardingScreen,
        name: AppRouteName.firstOnboardingScreen,
        pageBuilder: (context, state) => slidePage(
          context: context,
          state: state,
          child: const FirstOnboardingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.choiceYourRoleScreen,
        name: AppRouteName.choiceYourRoleScreen,
        pageBuilder: (context, state) => slidePage(
          context: context,
          state: state,
          child: ChooseYourRoleScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.loginScreen,
        name: AppRouteName.loginScreen,
        pageBuilder: (context, state) =>
            slidePage(context: context, state: state, child: LoginScreen()),
      ),
      GoRoute(
        path: AppRoutePath.loginEmailScreen,
        name: AppRouteName.loginEmailScreen,
        pageBuilder: (context, state) => slidePage(
          context: context,
          state: state,
          child: LoginEmailScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.signUpScreen,
        name: AppRouteName.signUpScreen,
        pageBuilder: (context, state) =>
            slidePage(context: context, state: state, child: SignUpScreen()),
      ),
      GoRoute(
        path: AppRoutePath.signUpEmailScreen,
        name: AppRouteName.signUpEmailScreen,
        pageBuilder: (context, state) => slidePage(
          context: context,
          state: state,
          child: SignUpEmailScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.verifyOtpScreen,
        name: AppRouteName.verifyOtpScreen,
        pageBuilder: (context, state) =>
            slidePage(context: context, state: state, child: VerifyOtpScreen()),
      ),
      GoRoute(
        path: AppRoutePath.successViewScreen,
        name: AppRouteName.successViewScreen,
        pageBuilder: (context, state) => bottomSlidePage(
          context: context,
          state: state,
          child: SuccessViewScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.dashboardScreen,
        name: AppRouteName.dashboardScreen,
        pageBuilder: (context, state) => bottomSlidePage(
          context: context,
          state: state,
          child: DashboardScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutePath.browseCoursesScreen,
        name: AppRouteName.browseCoursesScreen,
        pageBuilder: (context, state) =>
            slidePage(context: context, state: state, child: HomeScreen()),
      ),
    ],
  );

  static CustomTransitionPage<void> slidePage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 280),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        final secondaryTween = Tween(
          begin: Offset.zero,
          end: const Offset(-0.3, 0.0),
        ).chain(CurveTween(curve: curve));
        final secondaryOffsetAnimation = secondaryAnimation.drive(
          secondaryTween,
        );

        return SlideTransition(
          position: secondaryOffsetAnimation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }

  static CustomTransitionPage<void> bottomSlidePage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 280),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        final secondaryTween = Tween(
          begin: Offset.zero,
          end: const Offset(0.0, -0.1),
        ).chain(CurveTween(curve: curve));
        final secondaryOffsetAnimation = secondaryAnimation.drive(
          secondaryTween,
        );

        return SlideTransition(
          position: secondaryOffsetAnimation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }
}
