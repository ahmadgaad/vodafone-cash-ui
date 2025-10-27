import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class CardHeaderLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final double? fontSize;

  const CardHeaderLabel({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.iconSize,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 13.sp,
            color: textColor ?? AppColors.black,
          ),
        ),
        8.horizontalSpace,
        Icon(
          icon,
          size: iconSize ?? 20.sp,
          color: iconColor ?? AppColors.black,
        ),
      ],
    );
  }
}
