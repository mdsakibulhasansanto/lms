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
import 'package:lms/features/splash_onboarding/view/first_onboarding_screen.dart';
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
        builder: (context, state) => const FirstOnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutePath.choiceYourRoleScreen,
        name: AppRouteName.choiceYourRoleScreen,
        builder: (context, state) => ChooseYourRoleScreen(),

      ),


      //=========================== Authentication============================

      GoRoute(
        path: AppRoutePath.loginScreen,
        name: AppRouteName.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutePath.loginEmailScreen,
        name: AppRouteName.loginEmailScreen,
        builder: (context, state) => LoginEmailScreen(),
      ),
      GoRoute(
        path: AppRoutePath.signUpScreen,
        name: AppRouteName.signUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutePath.signUpEmailScreen,
        name: AppRouteName.signUpEmailScreen,
        builder: (context, state) => SignUpEmailScreen(),
      ),
      GoRoute(
        path: AppRoutePath.verifyOtpScreen,
        name: AppRouteName.verifyOtpScreen,
        builder: (context, state) => VerifyOtpScreen(),
      ),

      GoRoute(
        path: AppRoutePath.successViewScreen,
        name: AppRouteName.successViewScreen,
        builder: (context, state) => SuccessViewScreen(),
      ),
      GoRoute(
        path: AppRoutePath.dashboardScreen,
        name: AppRouteName.dashboardScreen,
        builder: (context, state) => DashboardScreen(),
      ),

      GoRoute(
        path: AppRoutePath.browseCoursesScreen,
        name: AppRouteName.browseCoursesScreen,
        builder: (context, state) => HomeScreen(),
      ),


    ],
  );
}