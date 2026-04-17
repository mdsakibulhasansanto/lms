import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_primary_button.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  final Set<String> _selectedTopics = {'Web Design'};
  final Set<String> _selectedMore = {'Popular', 'New'};
  RangeValues _priceRange = const RangeValues(0, 75);

  bool _topicExpanded = true;
  bool _moreExpanded = true;
  bool _priceExpanded = true;

  final List<String> _topics = [
    'Web Design',
    'Graphics',
    'Art & Media',
    'Product Design',
    'Web Design',
    'Graphics',
    'Product Design',
  ];

  final List<String> _moreFilters = [
    'Popular',
    'Free',
    'Discounted',
    'New',
    'Dance',
    'Film',
    'Film',
    'Discounted',
    'New',
    'Popular',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.82,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.r),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        _buildHeader(),
                        SizedBox(height: 16.h),
                        _buildCollapsibleSection(
                          title: 'By Topic',
                          isExpanded: _topicExpanded,
                          onToggle: () => setState(() => _topicExpanded = !_topicExpanded),
                          child: _buildChips(_topics, _selectedTopics),
                        ),
                        Divider(color: AppColors.grey200, height: 1),
                        SizedBox(height: 16.h),
                        _buildCollapsibleSection(
                          title: 'More',
                          isExpanded: _moreExpanded,
                          onToggle: () => setState(() => _moreExpanded = !_moreExpanded),
                          child: _buildChips(_moreFilters, _selectedMore),
                        ),
                        Divider(color: AppColors.grey200, height: 1),
                        SizedBox(height: 16.h),
                        _buildPriceRange(),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: _buildActionButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Filter',
          style: AppTextStyles.publicSans_semiBold_16_center(
              color: AppColors.queryColors),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.close, size: 16.sp, color: AppColors.queryColors),
          ),
        ),
      ],
    );
  }

  Widget _buildCollapsibleSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.publicSans_medium_16(
                    color: AppColors.grey800),
              ),
              AnimatedRotation(
                turns: isExpanded ? 0 : 0.5,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 20.sp,
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              child,
              SizedBox(height: 16.h),
            ],
          ),
          secondChild: const SizedBox.shrink(),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _buildChips(List<String> items, Set<String> selected) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: items.map((item) {
        final isSelected = selected.contains(item);
        return GestureDetector(
          onTap: () => setState(() {
            isSelected ? selected.remove(item) : selected.add(item);
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary500 : AppColors.grey100,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: isSelected ? AppColors.primary500 : AppColors.grey300,
              ),
            ),
            child: Text(
              item,
              style: AppTextStyles.inter_regular_12(
                color: isSelected ? AppColors.white : AppColors.grey700,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _priceExpanded = !_priceExpanded),
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price Range',
                style: AppTextStyles.publicSans_medium_16(
                    color: AppColors.grey800),
              ),
              AnimatedRotation(
                turns: _priceExpanded ? 0 : 0.5,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 20.sp,
                  color: AppColors.grey600,
                ),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'USD',
                    style: AppTextStyles.inter_regular_12(
                        color: AppColors.grey600),
                  ),
                  Text(
                    '\$${_priceRange.end.toInt()}',
                    style: AppTextStyles.inter_regular_12(
                        color: AppColors.grey600),
                  ),
                  Text(
                    '\$150',
                    style: AppTextStyles.inter_regular_12(
                        color: AppColors.grey600),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.primary500,
                  inactiveTrackColor: AppColors.grey300,
                  thumbColor: AppColors.primary500,
                  overlayColor: AppColors.primary500.withValues(alpha: 0.15),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                  trackHeight: 4.h,
                  rangeThumbShape:
                  RoundRangeSliderThumbShape(enabledThumbRadius: 8.r),
                ),
                child: RangeSlider(
                  values: _priceRange,
                  min: 0,
                  max: 150,
                  onChanged: (val) => setState(() => _priceRange = val),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          secondChild: const SizedBox.shrink(),
          crossFadeState: _priceExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => setState(() {
              _selectedTopics.clear();
              _selectedMore.clear();
              _priceRange = const RangeValues(0, 150);
            }),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.bordersColore),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              'Reset Filter',
              style: AppTextStyles.publicSans_medium_16(
                  color: AppColors.grey700),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: PrimaryButton(
            onPressed: () => Navigator.pop(context),
            text: 'Search',
            height: 46.h,
          ),
        ),
      ],
    );
  }
}