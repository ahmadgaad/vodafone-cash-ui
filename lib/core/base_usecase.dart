import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<String, T>> call({required Params params});
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
