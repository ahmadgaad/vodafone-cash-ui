import '../../../../core/mock_data/mock_data.dart';
import '../models/balance_model.dart';
import '../models/promotion_model.dart';
import '../models/service_card_model.dart';
import '../models/service_model.dart';

abstract class HomeRemoteDataSource {
  Future<BalanceModel> getBalance();
  Future<List<ServiceCardModel>> getServiceCards();
  Future<List<ServiceModel>> getServices();
  Future<List<PromotionModel>> getPromotions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl();

  @override
  Future<BalanceModel> getBalance() async {
    await MockData.simulateDelay();
    return MockData.getMockBalance();
  }

  @override
  Future<List<ServiceCardModel>> getServiceCards() async {
    await MockData.simulateDelay();
    return MockData.getMockServiceCards();
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    await MockData.simulateDelay();
    return MockData.getMockServices();
  }

  @override
  Future<List<PromotionModel>> getPromotions() async {
    await MockData.simulateDelay();
    return MockData.getMockPromotions();
  }
}
