import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/home_offer_card.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class OctoberOffersSection extends StatelessWidget {
  const OctoberOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.auto_awesome, color: AppColors.warning, size: 24),
              SizedBox(width: AppDimensions.spacingS),
              Text(AppStrings.octoberOffers, style: AppTextStyles.headline3),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.spacingL),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 160.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
              itemCount: 3,
              itemBuilder: (context, index) {
                return HomeOfferCard(index: index);
              },
            ),
          ),
        ),
        SizedBox(height: AppDimensions.spacingXl),
      ],
    );
  }
}
