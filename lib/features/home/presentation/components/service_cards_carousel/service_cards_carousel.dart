import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/custom_page_indicator.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_dimensions.dart';
import '../../../../../core/widgets/animated_fade_in.dart';
import '../../../data/models/service_card_model.dart';
import 'balance_service_card_content.dart';
import 'card_header_label.dart';
import 'home_internet_service_card_content.dart';
import 'internet_service_card_content.dart';

class ServiceCardsCarousel extends StatefulWidget {
  final List<ServiceCardModel> cards;

  const ServiceCardsCarousel({super.key, required this.cards});

  @override
  State<ServiceCardsCarousel> createState() => _ServiceCardsCarouselState();
}

class _ServiceCardsCarouselState extends State<ServiceCardsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 100),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(AppDimensions.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPageIndicator(
                    itemCount: widget.cards.length,
                    currentPage: _currentPage,
                    reverse: true,
                  ),
                  CardHeaderLabel(
                    icon: _getIconForCardType(widget.cards[_currentPage].type),
                    text: _getTextForCardType(widget.cards[_currentPage].type),
                  ),
                ],
              ),

              SizedBox(
                height: 130.h,
                child: PageView.builder(
                  controller: _pageController,
                  reverse: true,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: widget.cards.length,
                  itemBuilder: (context, index) {
                    final card = widget.cards[index];
                    return _buildCardContentForType(card);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForCardType(CardType type) {
    switch (type) {
      case CardType.balance:
        return Icons.local_offer_outlined;
      case CardType.internet:
        return Icons.signal_cellular_alt;
      case CardType.homeInternet:
        return Icons.home_outlined;
    }
  }

  String _getTextForCardType(CardType type) {
    switch (type) {
      case CardType.balance:
        return 'الإستهلاك';
      case CardType.internet:
        return 'الإنترنت';
      case CardType.homeInternet:
        return 'الإنترنت المنزلي';
    }
  }

  Widget _buildCardContentForType(ServiceCardModel card) {
    switch (card.type) {
      case CardType.balance:
        return BalanceServiceCardContent(card: card);
      case CardType.internet:
        return InternetServiceCardContent(card: card);
      case CardType.homeInternet:
        return HomeInternetServiceCardContent(card: card);
    }
  }
}
