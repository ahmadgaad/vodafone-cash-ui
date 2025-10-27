import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/mock_data/mock_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../components/profile_header.dart';
import '../components/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = MockData.getMockUserProfile();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text(AppStrings.profile), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppDimensions.spacingL),
              Container(
                padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
                color: AppColors.cardWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickAction(Icons.flight, 'التجوال'),
                    _buildQuickAction(Icons.swap_horiz, 'تحويل رصيد'),
                    _buildQuickAction(Icons.phone_android, 'نظامي'),
                    _buildQuickAction(Icons.swap_vert, 'الموبايل إنترنت'),
                    _buildQuickAction(Icons.home_outlined, 'الصفحة الرئيسية'),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.spacingL),
              ProfileHeader(profile: profile),
              SizedBox(height: AppDimensions.spacingL),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                padding: EdgeInsets.all(AppDimensions.paddingL),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.cardWhite,
                        size: 20,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.latestVersion,
                          style: AppTextStyles.label,
                        ),
                        Text(
                          AppStrings.versionNumber,
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.spacingXl),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.payments, style: AppTextStyles.headline3),
                    SizedBox(height: AppDimensions.spacingM),
                    ProfileMenuItem(
                      icon: Icons.receipt_long_outlined,
                      title: AppStrings.previousPayments,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.credit_card_outlined,
                      title: AppStrings.manageCards,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.spacingXl),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: ProfileMenuItem(
                  icon: Icons.location_on_outlined,
                  title: AppStrings.myAddress,
                  onTap: () {},
                ),
              ),
              SizedBox(height: AppDimensions.spacingXl),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.settings, style: AppTextStyles.headline3),
                    SizedBox(height: AppDimensions.spacingM),
                    ProfileMenuItem(
                      icon: Icons.language,
                      title: AppStrings.language,
                      trailing: Text(
                        AppStrings.arabic,
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.primaryRed,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.notifications_outlined,
                      title: AppStrings.notificationSettings,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.lock_outline,
                      title: AppStrings.changePassword,
                      onTap: () {},
                    ),
                    ProfileMenuItem(
                      icon: Icons.logout,
                      title: AppStrings.logout,
                      iconColor: AppColors.primaryRed,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.spacingXxl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.divider),
          ),
          child: Icon(icon, color: AppColors.textGrey, size: 24),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
