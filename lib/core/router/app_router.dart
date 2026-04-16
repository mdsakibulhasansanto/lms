import 'package:go_router/go_router.dart';
import 'package:lms/core/router/app_route_name.dart';
import 'package:lms/core/router/app_route_path.dart';
import 'package:lms/features/splash_onboarding/view/first_onboarding_screen.dart';
import 'package:lms/features/splash_onboarding/view/splash_screen.dart';

import '../../features/choose_your_role/view/choose_your_role_screen.dart';

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

    ],
  );
}