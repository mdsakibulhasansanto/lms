import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';

class LMS extends StatelessWidget {
  const LMS({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'LMS',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}