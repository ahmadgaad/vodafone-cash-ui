import 'package:dartz/dartz.dart';
import 'package:vodafone_ui_clone/core/base_usecase.dart';

import '../../data/models/service_card_model.dart';
import '../repositories/home_repository.dart';

class GetServiceCardsUseCase
    extends BaseUsecase<List<ServiceCardModel>, NoParams> {
  final HomeRepository repository;

  GetServiceCardsUseCase(this.repository);

  @override
  Future<Either<String, List<ServiceCardModel>>> call({
    required NoParams params,
  }) async {
    return await repository.getServiceCards();
  }
}
