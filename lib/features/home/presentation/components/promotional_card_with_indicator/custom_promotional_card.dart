import 'package:flutter/material.dart';
import 'package:vodafone_ui_clone/core/theme/app_text_styles.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimensions.dart';
import '../../../data/models/promotion_model.dart';

class CustomPromotionalCard extends StatelessWidget {
  final PromotionModel promotion;
  const CustomPromotionalCard({required this.promotion, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            right: 0,
            top: 0,
            child: Opacity(
              opacity: 0.2,
              child: Icon(
                Icons.phone_iphone,
                size: 120,
                color: AppColors.cardWhite,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  promotion.title,
                  style: AppTextStyles.promotionalCardTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppDimensions.spacingS),
                Text(
                  promotion.description,
                  style: AppTextStyles.promotionalCardDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
