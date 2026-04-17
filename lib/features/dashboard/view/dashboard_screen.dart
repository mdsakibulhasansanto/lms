import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/dashboard/view/settings_screen.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../browse_courses/view/screen/home_screen.dart';
import 'activities_screen.dart';
import 'courses_screen.dart';
import 'instructor_screen.dart';


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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, -6),
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: AppColors.primary500,
              backgroundColor: AppColors.primary500,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppTextStyles.inter_regular_12(color: AppColors.primary500);
                }
                return AppTextStyles.inter_regular_12(color: AppColors.grey500);
              }),
              iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
                if (states.contains(WidgetState.selected)) {
                  return IconThemeData(color: AppColors.white);
                }
                return IconThemeData(color: AppColors.grey500);
              }),
            ),
            child: NavigationBar(
              selectedIndex: _selectedIndex,
              backgroundColor: Colors.transparent,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_rounded, size: 24.sp),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_circle_outline_rounded, size: 24.sp),
                  label: 'Courses',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline_rounded, size: 24.sp),
                  label: 'Instructor',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bar_chart_rounded, size: 24.sp),
                  label: 'Activities',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined, size: 24.sp),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}