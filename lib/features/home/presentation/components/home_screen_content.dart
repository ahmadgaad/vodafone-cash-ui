import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/custom_home_app_bar.dart';
import 'package:vodafone_ui_clone/features/home/presentation/components/package_type.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../components/home_shimmer_loading.dart';
import '../components/october_offers_section.dart';
import '../components/promotional_card_with_indicator/promotional_carousel_with_indicator.dart';
import '../components/service_cards_carousel/service_cards_carousel.dart';
import '../components/service_grid/service_grid.dart';
import '../controller/home_cubit.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: AppDimensions.spacingM),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is HomeLoading ||
              current is HomeLoaded ||
              current is HomeError,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator.adaptive(
                    onRefresh: () => context.read<HomeCubit>().refresh(),
                    color: AppColors.primaryRed,
                    child: _buildBody(state),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    if (state is HomeLoading) {
      return const HomeShimmerLoading();
    } else if (state is HomeLoaded) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Carousel
            PromotionalCarousel(promotions: state.promotions),
            SizedBox(height: AppDimensions.spacingL),
            // Flex 100 Container
            PackageType(),
            SizedBox(height: AppDimensions.spacingL),
            // Service Cards Carousel
            ServiceCardsCarousel(cards: state.serviceCards),
            SizedBox(height: AppDimensions.spacingL),
            // Service Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
              child: ServiceGrid(services: state.services),
            ),
            SizedBox(height: AppDimensions.spacingXl),
            // October Offers Section
            OctoberOffersSection(),
          ],
        ),
      );
    } else if (state is HomeError) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.primaryRed,
                ),
                SizedBox(height: AppDimensions.spacingM),
                Text(
                  'Oops! Something went wrong',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: AppDimensions.spacingS),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                ),
                SizedBox(height: AppDimensions.spacingL),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
