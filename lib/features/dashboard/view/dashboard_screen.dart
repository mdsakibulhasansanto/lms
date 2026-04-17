import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../browse_courses/view/screen/home_screen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CoursesScreen(),
    InstructorScreen(),
    ActivitiesScreen(),
    SettingsScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          backgroundColor: AppColors.white,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppTextStyles.inter_regular_12(color: AppColors.primary500);
            }
            return AppTextStyles.inter_regular_12(color: AppColors.grey500);
          }),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: AppColors.primary500);
            }
            return IconThemeData(color: AppColors.grey500);
          }),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          backgroundColor: AppColors.white,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_rounded,
                color: _selectedIndex == 0 ? AppColors.primary500 : AppColors.grey500,
                size: 24.sp,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.play_circle_outline_rounded,
                color: _selectedIndex == 1 ? AppColors.primary500 : AppColors.grey500,
                size: 24.sp,
              ),
              label: 'Courses',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline_rounded,
                color: _selectedIndex == 2 ? AppColors.primary500 : AppColors.grey500,
                size: 24.sp,
              ),
              label: 'Instructor',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.bar_chart_rounded,
                color: _selectedIndex == 3 ? AppColors.primary500 : AppColors.grey500,
                size: 24.sp,
              ),
              label: 'Activities',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                color: _selectedIndex == 4 ? AppColors.primary500 : AppColors.grey500,
                size: 24.sp,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}


class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Course data not yet'),
      ),
    );
  }
}


class InstructorScreen extends StatelessWidget {
  const InstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('InstructorScreen data not yet'),
      ),
    );
  }
}


class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ActivitiesScreen data not yet'),
      ),
    );
  }
}


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings Screen data not yet'),
      ),
    );
  }
}


