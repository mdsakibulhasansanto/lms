




import 'package:flutter/material.dart';
import 'package:lms/core/theme/app_colors.dart';
import 'package:lms/core/theme/app_text_styles.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Course screen data not yet',
          style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
        ),
      ),
    );
  }
}