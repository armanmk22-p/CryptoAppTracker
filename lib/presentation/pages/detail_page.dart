import 'package:crypto_tracker_bloc/common/common.dart';
import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:crypto_tracker_bloc/presentation/manager/bloc/coinchart_bloc/coin_chart_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final CoinEntity coinEntity;

  const DetailPage({super.key, required this.coinEntity,required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
    context.read<CoinChartBloc>().add(CoinChartEvent(name: widget.id, day: '1'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Details'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              widget.coinEntity.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: BlocBuilder<CoinChartBloc, CoinChartState>(
              builder: (context, state) {
                if(state is CoinChartLoadedState){
                  return LineChart(
                    LineChartData(
                      minX: state.minX,
                      minY: state.minY,
                      maxX: state.maxX,
                      maxY: state.maxY,
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(
                        getDrawingHorizontalLine: (value) =>
                        const FlLine(strokeWidth: 0),
                        getDrawingVerticalLine: (value) =>
                        const FlLine(strokeWidth: 0),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          color: Colors.teal,
                          barWidth: 2,
                         // isCurved: true,
                         // curveSmoothness: 1,
                          // belowBarData: BarAreaData(
                          //   color: Colors.teal.withOpacity(0.3),
                          // ),
                          spots: state.flSpotList,
                          dotData: const FlDotData(show: false),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),


          const SizedBox(height: 200,),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CoinChartBloc>().add(
                        CoinChartEvent(
                            name: widget.id,
                            day: '1'),);
                    },
                    child: const Text('1d'),),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CoinChartBloc>().add(
                        CoinChartEvent(
                            name: widget.id,
                            day: '15'),);
                    },
                    child: const Text('15d'),),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {

                      context.read<CoinChartBloc>().add(
                        CoinChartEvent(
                            name: widget.id,
                            day: '30'),);
                    },
                    child: const Text('30d'),),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              )),

        ],
      ),
    );
  }
}
