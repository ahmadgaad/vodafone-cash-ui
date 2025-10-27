import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_balance_usecase.dart';
import '../../features/home/domain/usecases/get_promotions_usecase.dart';
import '../../features/home/domain/usecases/get_service_cards_usecase.dart';
import '../../features/home/domain/usecases/get_services_usecase.dart';
import '../../features/home/presentation/controller/home_cubit.dart';
import '../utils/cache_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // ========== Home Feature ==========
  // Cubit
  sl.registerFactory(
    () => HomeCubit(
      getBalanceUseCase: sl(),
      getServiceCardsUseCase: sl(),
      getServicesUseCase: sl(),
      getPromotionsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetBalanceUseCase(sl()));
  sl.registerLazySingleton(() => GetServiceCardsUseCase(sl()));
  sl.registerLazySingleton(() => GetServicesUseCase(sl()));
  sl.registerLazySingleton(() => GetPromotionsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(sl()),
  );

  //! Core
  sl.registerLazySingleton(() => CacheHelper(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
