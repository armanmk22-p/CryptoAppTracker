part of 'coin_chart_bloc.dart';

abstract class CoinChartState extends Equatable {
  const CoinChartState();
}

class CoinChartInitial extends CoinChartState {
  @override
  List<Object> get props => [];
}

class CoinChartLoadingState extends CoinChartState {
  final bool isLoading;

  const CoinChartLoadingState({
    required this.isLoading,
  });
  @override
  List<Object> get props => [isLoading];

}

class CoinChartLoadedState extends CoinChartState {


   List<FlSpot> flSpotList=[];
   double minX=0.0;
   double maxX=0.0;
   double minY=0.0;
   double maxY=0.0;

   CoinChartLoadedState({
    //required this.isLoading,
  //  required this.isFirstTime,
    required this.flSpotList,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
  });

  @override
  List<Object> get props => [
       // isLoading,
      //  isFirstTime,
        flSpotList,
        minX,
        maxX,
        minY,
        maxY,
      ];
}

class CoinChartFailureSate extends CoinChartState {
  final String message;

  const CoinChartFailureSate({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
