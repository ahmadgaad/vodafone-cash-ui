import '../../../../core/utils/cache_helper.dart';
import '../models/balance_model.dart';
import '../models/promotion_model.dart';
import '../models/service_card_model.dart';
import '../models/service_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheBalance(BalanceModel balance);
  BalanceModel? getCachedBalance();
  Future<void> cacheServiceCards(List<ServiceCardModel> serviceCards);
  List<ServiceCardModel>? getCachedServiceCards();
  Future<void> cacheServices(List<ServiceModel> services);
  List<ServiceModel>? getCachedServices();
  Future<void> cachePromotions(List<PromotionModel> promotions);
  List<PromotionModel>? getCachedPromotions();
  Future<void> clearHomeCache();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final CacheHelper cacheHelper;

  HomeLocalDataSourceImpl(this.cacheHelper);

  @override
  Future<void> cacheBalance(BalanceModel balance) async {
    await cacheHelper.saveData(cacheHelper.balanceKey, balance.toJson());
  }

  @override
  BalanceModel? getCachedBalance() {
    final data = cacheHelper.getData(cacheHelper.balanceKey);
    return data != null ? BalanceModel.fromJson(data) : null;
  }

  @override
  Future<void> cacheServiceCards(List<ServiceCardModel> serviceCards) async {
    final jsonList = serviceCards.map((card) => card.toJson()).toList();
    await cacheHelper.saveListData(cacheHelper.serviceCardsKey, jsonList);
  }

  @override
  List<ServiceCardModel>? getCachedServiceCards() {
    final data = cacheHelper.getListData(cacheHelper.serviceCardsKey);
    return data?.map((json) => ServiceCardModel.fromJson(json)).toList();
  }

  @override
  Future<void> cacheServices(List<ServiceModel> services) async {
    final jsonList = services.map((service) => service.toJson()).toList();
    await cacheHelper.saveListData(cacheHelper.servicesKey, jsonList);
  }

  @override
  List<ServiceModel>? getCachedServices() {
    final data = cacheHelper.getListData(cacheHelper.servicesKey);
    return data?.map((json) => ServiceModel.fromJson(json)).toList();
  }

  @override
  Future<void> cachePromotions(List<PromotionModel> promotions) async {
    final jsonList = promotions.map((promo) => promo.toJson()).toList();
    await cacheHelper.saveListData(cacheHelper.promotionsKey, jsonList);
  }

  @override
  List<PromotionModel>? getCachedPromotions() {
    final data = cacheHelper.getListData(cacheHelper.promotionsKey);
    return data?.map((json) => PromotionModel.fromJson(json)).toList();
  }

  @override
  Future<void> clearHomeCache() async {
    await cacheHelper.clearCache(cacheHelper.balanceKey);
    await cacheHelper.clearCache(cacheHelper.serviceCardsKey);
    await cacheHelper.clearCache(cacheHelper.servicesKey);
    await cacheHelper.clearCache(cacheHelper.promotionsKey);
  }
}
