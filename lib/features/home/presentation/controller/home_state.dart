part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final BalanceModel balance;
  final List<ServiceCardModel> serviceCards;
  final List<ServiceModel> services;
  final List<PromotionModel> promotions;

  const HomeLoaded({
    required this.balance,
    required this.serviceCards,
    required this.services,
    required this.promotions,
  });

  HomeLoaded copyWith({
    BalanceModel? balance,
    List<ServiceCardModel>? serviceCards,
    List<ServiceModel>? services,
    List<PromotionModel>? promotions,
  }) {
    return HomeLoaded(
      balance: balance ?? this.balance,
      serviceCards: serviceCards ?? this.serviceCards,
      services: services ?? this.services,
      promotions: promotions ?? this.promotions,
    );
  }

  @override
  List<Object?> get props => [balance, serviceCards, services, promotions];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
