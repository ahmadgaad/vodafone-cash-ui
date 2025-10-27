import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_colors.dart';
import 'home/presentation/screens/home_screen.dart';
import 'messages/presentation/screens/messages_screen.dart';
import 'more/presentation/screens/more_screen.dart';
import 'offers/presentation/screens/offers_screen.dart';
import 'profile/presentation/screens/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  final int initialIndex;

  const MainWrapper({super.key, this.initialIndex = 0});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = const [
    HomeScreen(),
    OffersScreen(),
    ProfileScreen(),
    MessagesScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10),
        child: FloatingActionButton(
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () => _onItemTapped(2),
          backgroundColor: _currentIndex == 2
              ? AppColors.primaryRed
              : AppColors.cardWhite,
          child: FaIcon(
            FontAwesomeIcons.user,
            color: _currentIndex == 2 ? Colors.white : AppColors.black,
            size: 24.sp,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColors.cardWhite,
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        notchMargin: 16.r,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(
                  icon: FontAwesomeIcons.bars,
                  label: AppStrings.navMore,
                  index: 4,
                ),
                26.horizontalSpace,
                _buildNavItem(
                  icon: FontAwesomeIcons.message,
                  label: AppStrings.navMessages,
                  index: 3,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(
                  icon: FontAwesomeIcons.fireFlameCurved,
                  label: AppStrings.navOffers,
                  index: 1,
                ),
                26.horizontalSpace,
                _buildNavItem(
                  icon: FontAwesomeIcons.mobileScreen,
                  label: AppStrings.navHome,
                  index: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              color: isSelected ? AppColors.primaryRed : AppColors.black,
              fontWeight: FontWeight.normal,
              size: 24.sp,
            ),
            4.verticalSpace,
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.primaryRed : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
