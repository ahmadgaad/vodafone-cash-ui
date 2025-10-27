import 'package:dartz/dartz.dart';
import 'package:vodafone_ui_clone/core/base_usecase.dart';

import '../../data/models/promotion_model.dart';
import '../repositories/home_repository.dart';

class GetPromotionsUseCase extends BaseUsecase<List<PromotionModel>, NoParams> {
  final HomeRepository repository;

  GetPromotionsUseCase(this.repository);

  @override
  Future<Either<String, List<PromotionModel>>> call({
    required NoParams params,
  }) async {
    return await repository.getPromotions();
  }
}
