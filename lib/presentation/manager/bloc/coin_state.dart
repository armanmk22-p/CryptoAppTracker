part of 'coin_bloc.dart';

abstract class CoinState extends Equatable {
  const CoinState();
}

class CoinInitial extends CoinState {
  @override
  List<Object> get props => [];
}

class CoinLoadingState extends CoinState {
  @override
  List<Object?> get props => [];
}

class CoinLoadedState extends CoinState {
  final List<CoinEntity> coinList;

  const CoinLoadedState({
    required this.coinList,
  });

  @override
  List<Object> get props => [
        coinList,
      ];
}

class CoinFailureState extends CoinState {
  final String message;

  const CoinFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
