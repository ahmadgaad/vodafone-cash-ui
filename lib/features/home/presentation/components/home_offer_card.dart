import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class HomeOfferCard extends StatelessWidget {
  final int index;
  const HomeOfferCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.only(left: AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.3,
              child: Icon(
                Icons.local_offer,
                size: 100,
                color: AppColors.cardWhite,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  index == 0
                      ? 'Apple Watch Series 11'
                      : index == 1
                      ? 'خصم 30%'
                      : 'عروض حصرية',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardWhite,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: AppDimensions.spacingS),
                Text(
                  index == 0
                      ? 'متـــــاح الان بالتقسيط حتى 12 شهر'
                      : index == 1
                      ? 'على جميع خدمات فودافون'
                      : 'احصل على عروض حصرية الآن',
                  style: TextStyle(fontSize: 13, color: AppColors.cardWhite),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
