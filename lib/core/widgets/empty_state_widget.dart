





import 'package:flutter/cupertino.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.increase_quotelevel,
            size: 64,
            color: CupertinoColors.systemGrey,
          ),
          SizedBox(height: 16),
          Text(
            'No data available',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }
}
