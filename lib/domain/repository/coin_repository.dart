


import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto_tracker_bloc/common/common.dart';

abstract class CoinRepository{

  Future<Either<Failure,List<CoinEntity>>> getCoins();
  //Future<Either<Failure,List<CoinChartEntity>>> coinChart(String coinName, String day);
  Future<Either<Failure,List<PriceAndTimeEntity>>> getCoiChart(String coinName, String day);
}