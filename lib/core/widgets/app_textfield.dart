



import 'package:flutter/cupertino.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: CupertinoTextField(
        placeholder: 'Enter text',
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CupertinoColors.separator, width: 1),
        ),
      ),
    );
  }
}
