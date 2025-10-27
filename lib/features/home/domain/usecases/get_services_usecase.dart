import 'package:dartz/dartz.dart';
import 'package:vodafone_ui_clone/core/base_usecase.dart';

import '../../data/models/service_model.dart';
import '../repositories/home_repository.dart';

class GetServicesUseCase extends BaseUsecase<List<ServiceModel>, NoParams> {
  final HomeRepository repository;

  GetServicesUseCase(this.repository);

  @override
  Future<Either<String, List<ServiceModel>>> call({
    required NoParams params,
  }) async {
    return await repository.getServices();
  }
}
