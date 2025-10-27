import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/service_card_model.dart';

class HomeInternetServiceCardContent extends StatelessWidget {
  final ServiceCardModel card;

  const HomeInternetServiceCardContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: AppDimensions.spacingL * 2),
        Text(
          "DSL أنت غير مشترك في باقة",
          style: AppTextStyles.bodyLarge.copyWith(color: AppColors.black),
        ),
        Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
            child: const Text("إشترك"),
          ),
        ),
      ],
    );
  }
}
