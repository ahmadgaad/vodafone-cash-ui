import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/offer_model.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.spacingL),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.local_offer_outlined,
              color: AppColors.primaryRed,
              size: 40,
            ),
            SizedBox(height: AppDimensions.spacingM),
            Text(
              offer.title,
              style: AppTextStyles.headline3,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: AppDimensions.spacingS),
            Text(
              offer.description,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: AppDimensions.spacingL),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(offer.ctaText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
