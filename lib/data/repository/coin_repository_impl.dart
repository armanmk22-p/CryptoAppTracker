import 'package:crypto_tracker_bloc/data/data.dart';
import 'package:crypto_tracker_bloc/data/model/price_and_time_model.dart';
import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:crypto_tracker_bloc/common/common.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CoinRepositoryImpl implements CoinRepository {
  final ServerApi serverApi;

  const CoinRepositoryImpl({
    required this.serverApi,
  });

  @override
  Future<Either<Failure, List<CoinEntity>>> getCoins() async {
    final result = await serverApi.getCoins();
    try {
      return right(result);
    } on DioExceptions catch (e) {
      final errorMessage =
      DioExceptions.fromDioError(e as DioException).toString();
      return left(
        ServerFailure(failureMessage:  errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<PriceAndTimeEntity>>> getCoiChart(String coinName, String day) async{

    final chartData = await serverApi.getCoinChart(coinName, day);
    try {
      return right(chartData);
    } on DioExceptions catch (e) {
      final errorMessage =
      DioExceptions.fromDioError(e as DioException).toString();
      return left(
        ServerFailure(failureMessage:  errorMessage),
      );
    }
  }


}
