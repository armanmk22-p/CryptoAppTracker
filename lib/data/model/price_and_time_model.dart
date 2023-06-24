import 'package:crypto_tracker_bloc/domain/domain.dart';

import 'coin_chart_model.dart';

class PriceAndTimeModel extends PriceAndTimeEntity {
  final int time;
  final double price;

  const PriceAndTimeModel({
    required this.time,
    required this.price,
  }) : super(time: time, price: price);

  //
  // factory PriceAndTimeModel.fromModel(CoinChartModel coinChartModel){
  //
  //    return PriceAndTimeModel(time: coinChartModel.prices[0] as int, price: coinChartModel.prices[1] as double);

  // factory PriceAndTimeModel.fromJson(List x) {
  //  // return PriceAndTimeModel(time: json['prices'][0], price: json['prices'][1]);
  //   return PriceAndTimeModel(time: x[0] as int, price: x[1] as double);
  // }
}
