import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/core/theme/app_colors.dart';
import 'package:vodafone_ui_clone/core/theme/app_dimensions.dart';
import 'package:vodafone_ui_clone/core/theme/app_text_styles.dart';

import '../../../data/models/service_card_model.dart';

class InternetServiceCardContent extends StatelessWidget {
  final ServiceCardModel card;

  const InternetServiceCardContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: AppDimensions.spacingL * 2),
        Text(
          "أنت غير مشترك في باقة موبايل إنترنت",
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
            child: const Text("شراء باقة"),
          ),
        ),
      ],
    );
  }
}
