


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CountryCodePicker extends StatefulWidget {
  final Country selectedCountry;
  final ValueChanged<Country> onChanged;

  const CountryCodePicker({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  void _showCountryPicker() {
    final searchController = TextEditingController();
    List<Country> filtered = List.from(countries);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.6,
              maxChildSize: 0.85,
              minChildSize: 0.4,
              builder: (_, scrollController) {
                return Column(
                  children: [
                    SizedBox(height: 12.h),
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColors.grey300,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.bordersColore,
                            width: 0.5.w,
                          ),
                        ),
                        child: TextField(
                          controller: searchController,
                          style: AppTextStyles.publicSans_regular_16_center(
                            color: AppColors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search country...',
                            hintStyle: AppTextStyles.publicSans_regular_16_center(
                              color: AppColors.hintColore,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.grey500,
                              size: 20.sp,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                          onChanged: (val) {
                            setModalState(() {
                              filtered = countries
                                  .where((c) =>
                              c.name.toLowerCase().contains(val.toLowerCase()) ||
                                  c.dialCode.contains(val))
                                  .toList();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) =>
                            Divider(height: 1, color: AppColors.grey300),
                        itemBuilder: (_, i) {
                          final c = filtered[i];
                          return ListTile(
                            leading: Text(c.flag, style: TextStyle(fontSize: 24.sp)),
                            title: Text(
                              c.name,
                              style: AppTextStyles.publicSans_regular_16_center(
                                color: AppColors.grey800,
                              ),
                            ),
                            trailing: Text(
                              c.dialCode,
                              style: AppTextStyles.publicSans_medium_16(
                                color: AppColors.grey600,
                              ),
                            ),
                            onTap: () {
                              widget.onChanged(c);
                              Navigator.pop(ctx);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCountryPicker,
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.bordersColore,
            width: 0.5.w,
          ),
        ),
        child: Row(
          children: [
            Text(widget.selectedCountry.flag, style: TextStyle(fontSize: 20.sp)),
            SizedBox(width: 6.w),
            Text(
              widget.selectedCountry.dialCode,
              style: AppTextStyles.publicSans_regular_16_center(color: AppColors.black),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.keyboard_arrow_down, size: 18.sp, color: AppColors.hintColore),
          ],
        ),
      ),
    );
  }
}




class Country {
  final String name;
  final String flag;
  final String dialCode;

  const Country({
    required this.name,
    required this.flag,
    required this.dialCode,
  });
}

final List<Country> countries = [
  Country(name: 'Bangladesh', flag: '🇧🇩', dialCode: '+880'),
  Country(name: 'United States', flag: '🇺🇸', dialCode: '+1'),
  Country(name: 'United Kingdom', flag: '🇬🇧', dialCode: '+44'),
  Country(name: 'India', flag: '🇮🇳', dialCode: '+91'),
  Country(name: 'Pakistan', flag: '🇵🇰', dialCode: '+92'),
  Country(name: 'Canada', flag: '🇨🇦', dialCode: '+1'),
  Country(name: 'Australia', flag: '🇦🇺', dialCode: '+61'),
  Country(name: 'Germany', flag: '🇩🇪', dialCode: '+49'),
  Country(name: 'France', flag: '🇫🇷', dialCode: '+33'),
  Country(name: 'Saudi Arabia', flag: '🇸🇦', dialCode: '+966'),
  Country(name: 'UAE', flag: '🇦🇪', dialCode: '+971'),
  Country(name: 'Malaysia', flag: '🇲🇾', dialCode: '+60'),
  Country(name: 'Singapore', flag: '🇸🇬', dialCode: '+65'),
  Country(name: 'Turkey', flag: '🇹🇷', dialCode: '+90'),
  Country(name: 'Indonesia', flag: '🇮🇩', dialCode: '+62'),
  Country(name: 'China', flag: '🇨🇳', dialCode: '+86'),
  Country(name: 'Japan', flag: '🇯🇵', dialCode: '+81'),
  Country(name: 'South Korea', flag: '🇰🇷', dialCode: '+82'),
  Country(name: 'Brazil', flag: '🇧🇷', dialCode: '+55'),
  Country(name: 'Nigeria', flag: '🇳🇬', dialCode: '+234'),
];