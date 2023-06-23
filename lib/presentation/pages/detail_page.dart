import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:crypto_tracker_bloc/presentation/manager/bloc/coinchart_bloc/coin_chart_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final CoinEntity coinEntity;

  const DetailPage({super.key, required this.id, required this.coinEntity});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
    context
        .read<CoinChartBloc>()
        .add(CoinChartEvent(name: widget.coinEntity.name, day: '1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Details'),
      ),
      body: SafeArea(
          child:SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.coinEntity.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: BlocBuilder<CoinChartBloc, CoinChartState>(
                            builder: (context, state) {
                             // if (state is CoinChartLoadingState) {}
                             // if (state is CoinChartFailureSate) {}
                               if (state is CoinChartLoadedState) {
                                 return LineChart(
                                   LineChartData(
                                       minX:state.minX,
                                       minY: state.minY,
                                       maxX: state.maxX,
                                       maxY: state.maxY,
                                       borderData: FlBorderData(
                                         show: false,
                                       ),
                                       titlesData: const FlTitlesData(
                                         show: false,
                                       ),
                                       gridData:
                                       FlGridData(
                                           getDrawingHorizontalLine: (value) {
                                             return const FlLine(
                                               //color: Color(0Xff37434d),
                                               strokeWidth: 0,
                                             );
                                           }, getDrawingVerticalLine: (value) {
                                         return const FlLine(strokeWidth: 0);
                                       }),
                                       lineBarsData: [
                                         LineChartBarData(
                                             spots: state.flSpotList,
                                             dotData: const FlDotData(show: false),
                                             isCurved: true,
                                             barWidth: 4,
                                             color: Colors.teal,
                                             belowBarData: BarAreaData(
                                               show: true,
                                               color: Colors.teal.withOpacity(0.2),
                                             )),
                                       ]),
                                 );
                               }
                               return Container();

                            },
                          ),
                        ),
                      ),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<CoinChartBloc>().add(
                                        CoinChartEvent(
                                            name: widget.coinEntity.name,
                                            day: '1'));
                                  },
                                  child: const Text('1d')),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<CoinChartBloc>().add(
                                        CoinChartEvent(
                                            name: widget.coinEntity.name,
                                            day: '15'));
                                  },
                                  child: const Text('15d')),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<CoinChartBloc>().add(
                                        CoinChartEvent(
                                            name: widget.coinEntity.name,
                                            day: '30'));
                                  },
                                  child: const Text('30d')),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          )),
                    ],
                  ),
                )
          ),
    );
  }
}
