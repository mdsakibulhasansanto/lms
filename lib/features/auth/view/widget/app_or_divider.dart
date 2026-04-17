

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_text_styles.dart';

class AppOrDivider extends StatelessWidget {
  const AppOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDFE3E8), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            'Or',
            style: AppTextStyles.publicSans_medium_16(color: const Color(0xFF777777)),
          ),
        ),
        Expanded(child: Divider(color: const Color(0xFFDFE3E8), thickness: 1)),
      ],
    );
  }
}