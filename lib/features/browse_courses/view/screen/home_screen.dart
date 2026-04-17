import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/browse_courses/view/widget/build_banner_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/course_model.dart';
import '../widget/build_course_card.dart';
import '../widget/filter_panel.dart';
import '../widget/home_page_header.dart';



// ==============  course data ==========================
final List<CourseModel> _allCourses = [
  CourseModel(
    id: '1',
    title: 'UX Design for Businesses',
    category: 'Design / Graphic Khan',
    price: 20.00,
    rating: 4.8,
    reviewCount: 499,
    durationHrs: 24,
    imageUrl:
    'https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?w=600&q=80',
  ),
  CourseModel(
    id: '2',
    title: 'Python for Beginners',
    category: 'Programming / Code Hub',
    price: 35.00,
    rating: 4.6,
    reviewCount: 320,
    durationHrs: 18,
    imageUrl:
    'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?w=600&q=80',
  ),
  CourseModel(
    id: '3',
    title: 'Graphic Design Masterclass',
    category: 'Design / Creative Studio',
    price: 0,
    rating: 4.5,
    reviewCount: 280,
    durationHrs: 12,
    imageUrl:
    'https://images.unsplash.com/photo-1558655146-d09347e92766?w=600&q=80',
    isFree: true,
  ),
  CourseModel(
    id: '4',
    title: 'Flutter App Development',
    category: 'Development / App Masters',
    price: 45.00,
    rating: 4.9,
    reviewCount: 510,
    durationHrs: 30,
    imageUrl:
    'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=600&q=80',
  ),
  CourseModel(
    id: '5',
    title: 'Web Design Fundamentals',
    category: 'Design / Web Academy',
    price: 0,
    rating: 4.3,
    reviewCount: 190,
    durationHrs: 10,
    imageUrl:
    'https://images.unsplash.com/photo-1467232004584-a241de8bcf5d?w=600&q=80',
    isFree: true,
  ),
  CourseModel(
    id: '6',
    title: 'Data Science with Python',
    category: 'Data / Analytics Pro',
    price: 55.00,
    rating: 4.7,
    reviewCount: 430,
    durationHrs: 36,
    imageUrl:
    'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600&q=80',
  ),
];

// ==============  course categories ==========================
final List<String> _tabs = [
  'All',
  'UX Design',
  'Python',
  'Python',
  'Pyt',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTopRatedTab = 0;
  int _selectedFreeTab = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';


  // ============== Top rated course ==========================
  List<CourseModel> get _topRatedCourses {
    List<CourseModel> result =
    _allCourses.where((c) => !c.isFree).toList();
    if (_selectedTopRatedTab != 0) {
      final tab = _tabs[_selectedTopRatedTab].toLowerCase();
      result = result
          .where((c) =>
      c.category.toLowerCase().contains(tab) ||
          c.title.toLowerCase().contains(tab))
          .toList();
    }
    if (_searchQuery.isNotEmpty) {
      result = result
          .where((c) =>
      c.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.category.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return result;
  }

  //========================= Free course ==========================
  List<CourseModel> get _freeCourses {
    List<CourseModel> result =
    _allCourses.where((c) => c.isFree).toList();
    if (_selectedFreeTab != 0) {
      final tab = _tabs[_selectedFreeTab].toLowerCase();
      result = result
          .where((c) =>
      c.category.toLowerCase().contains(tab) ||
          c.title.toLowerCase().contains(tab))
          .toList();
    }
    if (_searchQuery.isNotEmpty) {
      result = result
          .where((c) =>
      c.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          c.category.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ================== Filter menu =======================
  void _showFilterPanel() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, anim1, anim2) => const FilterPanel(),
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: anim1, curve: Curves.easeOut),
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: UserHomePageHeader(
        imageUrl: 'https://randomuser.me/api/portraits/women/32.jpg',
        userName: 'Fahmida',
        cartCount: 2,
        onCartTap: () {},
        onProfileTap: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              _buildSearchBar(),
              SizedBox(height: 16.h),
              BuildBannerCard(),
              SizedBox(height: 20.h),
              _buildSectionHeader('Top Rated Courses'),
              SizedBox(height: 12.h),
              _buildTabBar(_selectedTopRatedTab, (i) {
                setState(() => _selectedTopRatedTab = i);
              }),
              SizedBox(height: 14.h),
              _buildCourseListVertical(_topRatedCourses),
              SizedBox(height: 16.h),
              _buildShowMore(),
              SizedBox(height: 20.h),
              _buildSectionHeader('Free Courses'),
              SizedBox(height: 12.h),
              _buildTabBar(_selectedFreeTab, (i) {
                setState(() => _selectedFreeTab = i);
              }),
              SizedBox(height: 14.h),
              _buildCourseListVertical(_freeCourses),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.bordersColore),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppTextStyles.inter_regular_12(
                      color: AppColors.hintColore),
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.grey500, size: 20.sp),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                    child: Icon(Icons.close,
                        color: AppColors.grey500, size: 18.sp),
                  )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: _showFilterPanel,
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.bordersColore),
              ),
              child: Icon(Icons.tune_rounded,
                  size: 20.sp, color: AppColors.grey700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        title,
        style: AppTextStyles.publicSans_medium_18(color: AppColors.grey800).copyWith(fontSize: 20.sp),
      ),
    );
  }

  Widget _buildTabBar(int selected, ValueChanged<int> onTap) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, i) {
          final isSelected = i == selected;
          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary500
                    : AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary500
                      : AppColors.bordersColore,
                ),
              ),
              child: Center(
                child: Text(
                  _tabs[i],
                  style: AppTextStyles.inter_regular_12(
                    color: isSelected
                        ? AppColors.white
                        : AppColors.grey600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseListVertical(List<CourseModel> courses) {
    if (courses.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Center(
          child: Text(
            'No courses found',
            style: AppTextStyles.publicSans_medium_16(
                color: AppColors.grey500),
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: courses.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (context, i) => BuildCourseCard(
        course: courses[i],
      ),);
  }

  Widget _buildShowMore() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Show More',
          style: AppTextStyles.inter_regular_12(color: AppColors.primary500)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

}

