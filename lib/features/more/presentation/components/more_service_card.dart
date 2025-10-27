import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../home/data/models/service_model.dart';

class MoreServiceCard extends StatelessWidget {
  final ServiceModel service;

  const MoreServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.spacingM),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL),
            child: Row(
              children: [
                Icon(Icons.chevron_left, color: AppColors.textGrey, size: 20),
                SizedBox(width: AppDimensions.spacingM),
                if (service.badge != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusRound,
                      ),
                    ),
                    child: Text(
                      service.badge!,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.cardWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const Spacer(),
                Text(
                  service.title,
                  style: AppTextStyles.label.copyWith(fontSize: 16),
                  textAlign: TextAlign.right,
                ),
                SizedBox(width: AppDimensions.spacingM),
                Icon(
                  _getIconData(service.iconName),
                  color: AppColors.primaryRed,
                  size: 32,
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
      case 'power_settings_new':
        return Icons.power_settings_new;
      case 'headset_mic':
        return Icons.headset_mic_outlined;
      case 'sim_card':
        return Icons.sim_card_outlined;
      case 'wifi_calling':
        return Icons.wifi_calling_3;
      case '5g':
        return Icons.five_g;
      case 'card_giftcard':
        return Icons.card_giftcard_outlined;
      case 'account_balance':
        return Icons.account_balance_wallet_outlined;
      case 'devices':
        return Icons.devices;
      default:
        return Icons.help_outline;
    }
  }
}
