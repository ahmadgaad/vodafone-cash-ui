import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimensions.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../data/models/service_card_model.dart';

class BalanceServiceCardContent extends StatefulWidget {
  final ServiceCardModel card;

  const BalanceServiceCardContent({super.key, required this.card});

  @override
  State<BalanceServiceCardContent> createState() =>
      _BalanceServiceCardContentState();
}

class _BalanceServiceCardContentState extends State<BalanceServiceCardContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation =
        Tween<double>(
          begin: 0.0,
          end: widget.card.amount / widget.card.maxAmount,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: AppDimensions.spacingL),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${toArabicNumbers(widget.card.amount.toInt())} ",
                style: AppTextStyles.balance,
              ),
              TextSpan(
                text: "${AppStrings.available} ",
                style: AppTextStyles.available,
              ),
              TextSpan(
                text: toArabicNumbers(widget.card.maxAmount.toInt()),
                style: AppTextStyles.available,
              ),
              TextSpan(
                text: " ${AppStrings.flex} ",
                style: AppTextStyles.available,
              ),
            ],
          ),
        ),

        SizedBox(height: AppDimensions.spacingM),

        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: _progressAnimation.value,
                  backgroundColor: AppColors.divider,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryRed,
                  ),
                  minHeight: 8.h,
                ),
              ),
            );
          },
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
              child: const Text(AppStrings.managePackage),
            ),
            SizedBox(width: AppDimensions.spacingM),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
              child: const Text(AppStrings.repurchase),
            ),
            Spacer(),
            Text(
              '${toArabicNumbers(widget.card.daysRemaining)} ${AppStrings.daysRemaining}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
