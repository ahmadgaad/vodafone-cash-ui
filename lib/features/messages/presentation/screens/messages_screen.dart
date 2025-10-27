import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/mock_data/mock_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../components/notification_card.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = MockData.getMockNotifications();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text(AppStrings.messages), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: AppDimensions.spacingL),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: Text(
                  AppStrings.notifications,
                  style: AppTextStyles.headline2,
                ),
              ),
              SizedBox(height: AppDimensions.spacingL),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(notification: notifications[index]);
                },
              ),
              SizedBox(height: AppDimensions.spacingXl),
            ],
          ),
        ),
      ),
    );
  }
}
