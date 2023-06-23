import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../common/common.dart';

part 'coin_event.dart';

part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final GetCoinsUseCase getCoinsUseCase;

  CoinBloc({required this.getCoinsUseCase}) : super(CoinInitial()) {
    on<CoinsListEvent>(_getCoins);
    on<CoinSearchEvent>(_searchCoin);
  }

  Future<void> _getCoins(CoinsListEvent event, Emitter<CoinState> emit) async {
    emit(CoinLoadingState());
    final result = await getCoinsUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(CoinFailureState(message: l.toString())),
      (r) => emit(CoinLoadedState(coinList: r)),
    );
  }

  Future<void> _searchCoin(CoinSearchEvent event, Emitter<CoinState> emit) async {
    emit(CoinLoadingState());
    final result = await getCoinsUseCase.call(const NoParameters());
    if(event.keySearch.isEmpty){
      result.fold(
            (l) => emit(CoinFailureState(message: l.toString())),
            (r) => emit(CoinLoadedState(coinList: r)),
      );
    }else{
      result.fold(
            (l) => emit(const CoinFailureState(message:'there is no such a coin')),
            (r){
             final result = r.where((element) => element.name.toLowerCase().contains(event.keySearch.toLowerCase())).toList();
              emit(CoinLoadedState(coinList: result));
            } ,
      );
    }

  }
}
