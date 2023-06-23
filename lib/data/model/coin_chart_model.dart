import 'package:crypto_tracker_bloc/data/model/price_and_time_model.dart';

import '../../domain/domain.dart';

class CoinChartModel extends CoinChartEntity {
  late List<PriceAndTimeModel> prices;

  CoinChartModel({
    required this.prices,
  }) : super(prices: prices);

  factory CoinChartModel.fromJson(Map<String, dynamic> json) {
    return CoinChartModel(
      prices: json['prices'],
    );
  }
}
