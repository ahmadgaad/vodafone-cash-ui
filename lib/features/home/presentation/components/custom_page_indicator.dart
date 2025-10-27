import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
    this.activeColor,
    this.inactiveColor,
    this.dotSize,
    this.dotSpacing,
    this.reverse = false,
  });

  final int itemCount;
  final int currentPage;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? dotSize;
  final double? dotSpacing;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final size = dotSize ?? 8.w;
    final spacing = dotSpacing ?? 4.w;

    final dots = List.generate(
      itemCount,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: spacing),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: currentPage == index
              ? (activeColor ?? AppColors.primaryRed)
              : (inactiveColor ?? AppColors.divider),
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: reverse ? dots.reversed.toList() : dots,
    );
  }
}
