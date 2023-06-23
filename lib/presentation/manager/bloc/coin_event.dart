part of 'coin_bloc.dart';

abstract class CoinEvent {
  const CoinEvent();
}

class CoinsListEvent extends CoinEvent {}

class CoinSearchEvent extends CoinEvent {
  final String keySearch;

  const CoinSearchEvent({
    required this.keySearch,
  });
}
