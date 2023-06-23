import 'package:crypto_tracker_bloc/domain/domain.dart';

class CoinModel extends CoinEntity {
  late String id;
  late String symbol;
  late String name;
  late String image;
  late int currentPrice;
 late double priceChange24h;
  late String lastUpdated;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChange24h,
    required this.lastUpdated,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          currentPrice: currentPrice,
          priceChange24h: priceChange24h,
          lastUpdated: lastUpdated,
        );

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      currentPrice: json['current_price']?.toInt() ?? 0,
      priceChange24h:json['price_change_24h']?.toDouble() ?? 0.0,
      lastUpdated: json['last_updated'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['price_change_24h'] = this.priceChange24h;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
