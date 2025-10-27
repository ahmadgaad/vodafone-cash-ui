import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/helpers.dart';
import '../../data/models/user_profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfileModel profile;

  const ProfileHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
      padding: EdgeInsets.all(AppDimensions.paddingXl),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.background,
            child: Icon(Icons.person, size: 40, color: AppColors.primaryRed),
          ),
          SizedBox(height: AppDimensions.spacingM),
          Text(profile.name, style: AppTextStyles.headline2),
          Text(
            toArabicNumbers(profile.phoneNumber),
            style: AppTextStyles.bodyMedium,
          ),
          SizedBox(height: AppDimensions.spacingL),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(AppStrings.edit),
                ),
              ),
              SizedBox(width: AppDimensions.spacingM),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(AppStrings.myAccounts),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
