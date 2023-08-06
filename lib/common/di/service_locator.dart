

import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/data.dart';

final locator = GetIt.instance;

Future<void> getInitial()async{

  ///class
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<DioClient>(() => DioClient(locator()));

  ///repository
  locator.registerLazySingleton<ServerApi>(() => ServerApiImpl(dioClient: locator()));
  locator.registerLazySingleton<CoinRepository>(() => CoinRepositoryImpl(serverApi: locator()));

  ///useCase
  locator.registerLazySingleton<GetCoinsUseCase>(() => GetCoinsUseCase(coinRepository: locator()));
  locator.registerLazySingleton<CoinChartUseCase>(() => CoinChartUseCase(coinRepository: locator()));
}