import 'package:dartz/dartz.dart';
import 'package:vodafone_ui_clone/core/base_usecase.dart';

import '../../data/models/balance_model.dart';
import '../repositories/home_repository.dart';

class GetBalanceUseCase extends BaseUsecase<BalanceModel, NoParams> {
  final HomeRepository repository;

  GetBalanceUseCase(this.repository);

  @override
  Future<Either<String, BalanceModel>> call({required NoParams params}) async {
    return await repository.getBalance();
  }
}
