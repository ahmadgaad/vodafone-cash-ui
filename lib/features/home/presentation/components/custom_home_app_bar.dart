import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.search, color: AppColors.cardWhite),
        onPressed: () {},
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.phone_iphone,
              color: AppColors.primaryRed,
              size: 24,
            ),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(right: AppDimensions.paddingL),
      backgroundColor: AppColors.primaryRed,
      foregroundColor: AppColors.cardWhite,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDimensions.appBarHeight);
}
