import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:equatable/equatable.dart';

class CoinChartEntity extends Equatable {
  final List<PriceAndTimeEntity> prices;

  const CoinChartEntity({
    required this.prices,
  });

  @override
  List<Object> get props => [prices];
}