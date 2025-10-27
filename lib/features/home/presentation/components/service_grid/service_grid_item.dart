import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/service_model.dart';

class ServiceGridItem extends StatelessWidget {
  final ServiceModel service;
  const ServiceGridItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: service.isDark ? AppColors.darkMaroon : AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        service.title,
                        style: AppTextStyles.label.copyWith(
                          color: service.isDark
                              ? AppColors.cardWhite
                              : AppColors.textDark,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: AppDimensions.spacingM),
                    Icon(
                      _getIconData(service.iconName),
                      color: service.isDark
                          ? AppColors.cardWhite
                          : AppColors.primaryRed,
                      size: 32,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.spacingL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: service.isDark
                          ? AppColors.cardWhite.withValues(alpha: 0.7)
                          : AppColors.textGrey,
                      size: 20,
                    ),
                    if (service.subtitle.isNotEmpty)
                      Text(
                        service.subtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: service.isDark
                              ? AppColors.cardWhite.withValues(alpha: 0.8)
                              : AppColors.textGrey,
                        ),
                        textAlign: TextAlign.right,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'account_balance_wallet':
        return Icons.account_balance_wallet_outlined;
      case 'shopping_cart':
        return Icons.shopping_cart_outlined;
      case 'movie':
        return Icons.movie_outlined;
      case 'payment':
        return Icons.payment_outlined;
      default:
        return Icons.help_outline;
    }
  }
}
