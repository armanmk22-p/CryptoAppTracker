import 'package:equatable/equatable.dart';

class PriceAndTimeEntity extends Equatable {
  final int time;
  final double price;

  const PriceAndTimeEntity({
    required this.time,
    required this.price,
  });

  @override
  List<Object> get props => [time, price];
}