import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../domain/domain.dart';

part 'coin_chart_event.dart';

part 'coin_chart_state.dart';

class CoinChartBloc extends Bloc<CoinChartEvent, CoinChartState> {
  final CoinChartUseCase coinChartUseCase;
  List<FlSpot> flSpotList = [];
  List<PriceAndTimeEntity> priceAndTime = [];

  CoinChartBloc({required this.coinChartUseCase}) : super(CoinChartInitial()) {
    on<CoinChartEvent>(_coinChartEvent);
  }

  Future<void> _coinChartEvent(
      CoinChartEvent event, Emitter<CoinChartState> emit) async {
    emit(const CoinChartLoadingState(isLoading: true));
    final result = await coinChartUseCase.call(event.name, event.day);
    result.fold((l) => null,
            (r) {

               flSpotList = [];
               priceAndTime = r;

              for (var element in priceAndTime) {
                flSpotList.add(FlSpot(element.time.toDouble(), element.price),);
              }

              emit(CoinChartLoadedState(
                flSpotList: flSpotList,
                minX: priceAndTime.first.time.toDouble(),
                maxX: priceAndTime.last.time.toDouble(),
                minY: priceAndTime.first.price,
                maxY: priceAndTime.last.price,
              ));
              // priceAndTime.sort((a, b) => a.price.compareTo(b.price));
            });

  }

}
