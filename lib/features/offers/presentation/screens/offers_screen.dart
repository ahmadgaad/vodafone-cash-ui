import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/mock_data/mock_data.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../components/filter_chips.dart';
import '../components/offer_card.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  String _selectedFilter = 'all';
  final _offers = MockData.getMockOffers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.offersTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppDimensions.spacingL),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                child: Container(
                  padding: EdgeInsets.all(AppDimensions.paddingXl),
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        size: 80,
                        color: AppColors.cardWhite,
                      ),
                      SizedBox(height: AppDimensions.spacingL),
                      Text(
                        AppStrings.bestOffer,
                        style: AppTextStyles.headline2.copyWith(
                          color: AppColors.cardWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppDimensions.spacingM),
                      Text(
                        'جدد باقتك وليك 65 فليكس بدل 50 لمدة اسبوع',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.cardWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppDimensions.spacingL),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cardWhite,
                          foregroundColor: AppColors.teal,
                        ),
                        child: const Text(AppStrings.enjoyOffer),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacingXl),
              FilterChips(
                selectedFilter: _selectedFilter,
                onFilterChanged: (filter) {
                  setState(() {
                    _selectedFilter = filter;
                  });
                },
              ),
              SizedBox(height: AppDimensions.spacingL),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                ),
                itemCount: _offers.length,
                itemBuilder: (context, index) {
                  final offer = _offers[index];
                  if (_selectedFilter != 'all' &&
                      offer.category != _selectedFilter) {
                    return const SizedBox.shrink();
                  }
                  return OfferCard(offer: offer);
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
