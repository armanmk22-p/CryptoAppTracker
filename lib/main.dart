import 'package:crypto_tracker_bloc/common/di/service_locator.dart';
import 'package:crypto_tracker_bloc/presentation/manager/bloc/coin_bloc.dart';
import 'package:crypto_tracker_bloc/presentation/manager/bloc/coinchart_bloc/coin_chart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/pages/my_home_page.dart';

Future<void> main() async {
  await getInitial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          CoinBloc(getCoinsUseCase: locator())
            ..add(CoinsListEvent()),
        ),
        BlocProvider(
          create: (context) => CoinChartBloc(coinChartUseCase: locator()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //brightness: Brightness.dark,
          textTheme: TextTheme(
            displayMedium:GoogleFonts.montserrat(
                color: Colors.black87,

              ),

          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade700),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

