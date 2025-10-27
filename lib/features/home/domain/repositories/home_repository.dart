import 'package:dartz/dartz.dart';

import '../../data/models/balance_model.dart';
import '../../data/models/promotion_model.dart';
import '../../data/models/service_card_model.dart';
import '../../data/models/service_model.dart';

abstract class HomeRepository {
  Future<Either<String, BalanceModel>> getBalance();

  Future<Either<String, List<ServiceCardModel>>> getServiceCards();

  Future<Either<String, List<ServiceModel>>> getServices();

  Future<Either<String, List<PromotionModel>>> getPromotions();

  Future<void> clearCache();
}
