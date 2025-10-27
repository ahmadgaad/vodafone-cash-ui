import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/custom_page_indicator.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/promotional_card_with_indicator/custom_promotional_card.dart';

import '../../../../../core/theme/app_dimensions.dart';
import '../../../data/models/promotion_model.dart';

class PromotionalCarousel extends StatefulWidget {
  final List<PromotionModel> promotions;

  const PromotionalCarousel({super.key, required this.promotions});

  @override
  State<PromotionalCarousel> createState() => _PromotionalCarouselState();
}

class _PromotionalCarouselState extends State<PromotionalCarousel> {
  int _currentPage = 0;
  late PageController _pageController;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.96, initialPage: 0);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  int _getActualIndex(int index) {
    final length = widget.promotions.length;
    return ((index % length) + length) % length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final promotionIndex = _getActualIndex(index);
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingS,
                ),
                child: CustomPromotionalCard(
                  promotion: widget.promotions[promotionIndex],
                ),
              );
            },
          ),
        ),
        SizedBox(height: AppDimensions.spacingM),
        CustomPageIndicator(
          itemCount: widget.promotions.length,
          currentPage: _getActualIndex(_currentPage),
        ),
      ],
    );
  }
}
