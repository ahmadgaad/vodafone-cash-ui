import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final isPromo = notification.type == 'promo';

    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.spacingL),
      decoration: BoxDecoration(
        color: isPromo ? AppColors.primaryRed : AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    notification.title,
                    style: AppTextStyles.headline3.copyWith(
                      color: isPromo ? AppColors.cardWhite : AppColors.textDark,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: AppDimensions.spacingS),
                  Text(
                    notification.description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isPromo
                          ? AppColors.cardWhite.withOpacity(0.9)
                          : AppColors.textGrey,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  if (!isPromo) ...[
                    SizedBox(height: AppDimensions.spacingS),
                    Text(
                      _formatDate(notification.timestamp),
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: AppDimensions.spacingM),
            Icon(
              isPromo ? Icons.local_offer : Icons.check_circle_outline,
              color: isPromo ? AppColors.cardWhite : AppColors.textGrey,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}
