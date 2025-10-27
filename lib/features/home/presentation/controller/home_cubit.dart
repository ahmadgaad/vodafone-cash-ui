import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodafone_ui_clone/core/base_usecase.dart';

import '../../data/models/balance_model.dart';
import '../../data/models/promotion_model.dart';
import '../../data/models/service_card_model.dart';
import '../../data/models/service_model.dart';
import '../../domain/usecases/get_balance_usecase.dart';
import '../../domain/usecases/get_promotions_usecase.dart';
import '../../domain/usecases/get_service_cards_usecase.dart';
import '../../domain/usecases/get_services_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBalanceUseCase getBalanceUseCase;
  final GetServiceCardsUseCase getServiceCardsUseCase;
  final GetServicesUseCase getServicesUseCase;
  final GetPromotionsUseCase getPromotionsUseCase;

  HomeCubit({
    required this.getBalanceUseCase,
    required this.getServiceCardsUseCase,
    required this.getServicesUseCase,
    required this.getPromotionsUseCase,
  }) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    try {
      final results = await Future.wait([
        getBalanceUseCase(params: NoParams()),
        getServiceCardsUseCase(params: NoParams()),
        getServicesUseCase(params: NoParams()),
        getPromotionsUseCase(params: NoParams()),
      ]);

      final balanceResult = results[0];
      final serviceCardsResult = results[1];
      final servicesResult = results[2];
      final promotionsResult = results[3];

      if (balanceResult.isLeft() ||
          serviceCardsResult.isLeft() ||
          servicesResult.isLeft() ||
          promotionsResult.isLeft()) {
        emit(const HomeError('Failed to load some data'));
        return;
      }

      late BalanceModel balance;
      late List<ServiceCardModel> serviceCards;
      late List<ServiceModel> services;
      late List<PromotionModel> promotions;

      balanceResult.fold((_) => null, (r) => balance = r as BalanceModel);
      serviceCardsResult.fold(
        (_) => null,
        (r) => serviceCards = r as List<ServiceCardModel>,
      );
      servicesResult.fold(
        (_) => null,
        (r) => services = r as List<ServiceModel>,
      );
      promotionsResult.fold(
        (l) => null,
        (r) => promotions = r as List<PromotionModel>,
      );

      emit(
        HomeLoaded(
          balance: balance,
          serviceCards: serviceCards,
          services: services,
          promotions: promotions,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> loadBalance() async {
    final result = await getBalanceUseCase(params: NoParams());
    result.fold((error) => emit(HomeError(error)), (balance) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        emit(currentState.copyWith(balance: balance));
      }
    });
  }

  Future<void> refresh() async {
    await loadHomeData();
  }
}
