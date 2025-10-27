import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class PackageType extends StatelessWidget {
  const PackageType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),

      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        // color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        gradient: LinearGradient(
          colors: [AppColors.darkRed, AppColors.primaryRed],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "فليكس ١٠٠",
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.cardWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: AppDimensions.spacingS),
          Icon(Icons.phone_iphone, color: AppColors.cardWhite),
        ],
      ),
    );
  }
}
