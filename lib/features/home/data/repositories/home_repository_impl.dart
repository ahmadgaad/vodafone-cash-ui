import 'package:dartz/dartz.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/balance_model.dart';
import '../models/promotion_model.dart';
import '../models/service_card_model.dart';
import '../models/service_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<String, BalanceModel>> getBalance() async {
    try {
      final balance = await remoteDataSource.getBalance();

      await localDataSource.cacheBalance(balance);

      return Right(balance);
    } catch (e) {
      final cachedBalance = localDataSource.getCachedBalance();
      if (cachedBalance != null) {
        return Right(cachedBalance);
      }

      return Left('Failed to load balance: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<ServiceCardModel>>> getServiceCards() async {
    try {
      final cards = await remoteDataSource.getServiceCards();

      await localDataSource.cacheServiceCards(cards);

      return Right(cards);
    } catch (e) {
      final cachedCards = localDataSource.getCachedServiceCards();
      if (cachedCards != null) {
        return Right(cachedCards);
      }

      return Left('Failed to load service cards: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<ServiceModel>>> getServices() async {
    try {
      final services = await remoteDataSource.getServices();

      await localDataSource.cacheServices(services);

      return Right(services);
    } catch (e) {
      final cachedServices = localDataSource.getCachedServices();
      if (cachedServices != null) {
        return Right(cachedServices);
      }

      return Left('Failed to load services: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<PromotionModel>>> getPromotions() async {
    try {
      final promotions = await remoteDataSource.getPromotions();

      await localDataSource.cachePromotions(promotions);

      return Right(promotions);
    } catch (e) {
      final cachedPromotions = localDataSource.getCachedPromotions();
      if (cachedPromotions != null) {
        return Right(cachedPromotions);
      }

      return Left('Failed to load promotions: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCache() async {
    await localDataSource.clearHomeCache();
  }
}
