import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final int currentPrice;
  final double priceChange24h;
  final String lastUpdated;

   const CoinEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24h,
    required this.lastUpdated,
  });

  @override
  List<Object> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        priceChange24h,
        lastUpdated,
      ];
}
