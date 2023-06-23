



import 'package:crypto_tracker_bloc/domain/domain.dart';
import '../../data.dart';

abstract class ServerApi {

  Future<List<CoinModel>> getCoins();
  // Future<List<CoinChartModel>> coinChart(String coinName, String day);
  Future<List<PriceAndTimeEntity>> getCoinChart(String coinName, String day);

}
