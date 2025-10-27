import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? iconColor;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.onTap,
    this.iconColor,
  });

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
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingM),
            child: Row(
              children: [
                Icon(Icons.chevron_left, color: AppColors.textGrey, size: 20),
                SizedBox(width: AppDimensions.spacingM),
                if (trailing != null) ...[
                  trailing!,
                  SizedBox(width: AppDimensions.spacingM),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.label,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: AppDimensions.spacingM),
                Icon(icon, color: iconColor ?? AppColors.textGrey, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
