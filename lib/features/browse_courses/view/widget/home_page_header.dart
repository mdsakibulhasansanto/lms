import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class UserHomePageHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? imageUrl;
  final String? userName;
  final int cartCount;
  final VoidCallback? onProfileTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationTap;

  const UserHomePageHeader({
    super.key,
    this.imageUrl,
    this.userName,
    this.cartCount = 0,
    this.onProfileTap,
    this.onCartTap,
    this.onNotificationTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        child: Row(
          children: [
            InkWell(
              onTap: onProfileTap,
              borderRadius: BorderRadius.circular(100.r),
              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                    ? NetworkImage(imageUrl!)
                    : null,
                child: imageUrl == null || imageUrl!.isEmpty
                    ? Icon(Icons.person, size: 22.sp)
                    : null,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello, ${userName ?? 'Hello,Santo'}',
                    style: AppTextStyles.publicSans_regular_14_center(
                      color: AppColors.textBody,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Browse or search your courses.',
                    style: AppTextStyles.inter_regular_12(
                      color: AppColors.grey500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            InkWell(
              onTap: onCartTap,
              borderRadius: BorderRadius.circular(8.r),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 24.sp,
                      color: AppColors.grey700,
                    ),
                  ),

                ],
              ),
            ),
            InkWell(
              onTap: onNotificationTap,
              borderRadius: BorderRadius.circular(8.r),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Icon(
                      Icons.notifications,
                      size: 24.sp,
                      color: AppColors.grey1000,
                    ),
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: cartCount > 9 ? 4.w : 5.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 15.w,
                          minHeight: 15.h,
                        ),
                        child: Text(
                          cartCount > 99 ? '99+' : cartCount.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.inter_regular_12(
                            color: AppColors.white,
                          ).copyWith(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}