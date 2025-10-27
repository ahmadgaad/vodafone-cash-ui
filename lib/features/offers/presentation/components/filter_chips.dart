import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class FilterChips extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  
  const FilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
      ),
      child: Row(
        children: [
          _buildChip(
            label: AppStrings.allOffers,
            value: 'all',
            isSelected: selectedFilter == 'all',
          ),
          SizedBox(width: AppDimensions.spacingM),
          _buildChip(
            label: AppStrings.flexBalance,
            value: 'flex',
            isSelected: selectedFilter == 'flex',
          ),
          SizedBox(width: AppDimensions.spacingM),
          _buildChip(
            label: AppStrings.entertainment,
            value: 'entertainment',
            isSelected: selectedFilter == 'entertainment',
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required String value,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onFilterChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
          vertical: AppDimensions.paddingL,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.teal : AppColors.cardWhite,
          borderRadius: BorderRadius.circular(AppDimensions.radiusRound),
          border: Border.all(
            color: isSelected ? AppColors.teal : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.cardWhite : AppColors.textDark,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

