import 'package:crypto_tracker_bloc/data/model/price_and_time_model.dart';
import 'package:dio/dio.dart';

import '../../data.dart';


class ServerApiImpl implements ServerApi {
  const ServerApiImpl({
    required this.dioClient,
  });

  final DioClient dioClient;

  @override
  Future<List<CoinModel>> getCoins() async {
    try {
      //RAW data -> the whole data that come from server
      final Response response = await dioClient.get(ApiConstants.coinList);
      //convert RAW data to Our class Model
      final coins = (response.data as List)
          .map((coin) => CoinModel.fromJson(coin))
          .toList();
      return coins;
    } on DioExceptions catch (e) {
      final errorMessage =
          DioExceptions.fromDioError(e as DioException).toString();
      throw errorMessage;
    }
  }

  // @override
  // Future<List<CoinChartModel>> coinChart(String coinName, String day) async{
  //   try{
  //     final Response response = await Dio().get(ApiConstants.marketChart(coinName, day));
  //     final chartData =( response.data['prices'] as List).map((e) => CoinChartModel.fromJson(e)).toList();
  //     chartData.map((e) => PriceAndTimeModel.fromModel(e));
  //     return chartData;
  //   } on DioExceptions catch(e){
  //     final errorMessage = DioExceptions.fromDioError(e as DioException).toString();
  //     throw errorMessage;
  //   }
  //
  // }

  Future<List<PriceAndTimeModel>> getCoinChart(String coinName, String day) async{
    try{
      final Response response = await Dio().get(ApiConstants.marketChart(coinName, day));
      final chartData =(response.data['prices'] as List).map((e) => PriceAndTimeModel.fromJson(e)).toList();
      return chartData;
    } on DioExceptions catch(e){
      final errorMessage = DioExceptions.fromDioError(e as DioException).toString();
      throw errorMessage;
    }
  }

}
