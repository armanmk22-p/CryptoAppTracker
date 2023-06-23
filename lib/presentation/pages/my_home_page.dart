
import 'package:crypto_tracker_bloc/presentation/manager/bloc/coin_bloc.dart';
import 'package:crypto_tracker_bloc/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> getCoins() async {}

  @override
  void initState() {
    super.initState();
    context.read<CoinBloc>().add(CoinsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('crypto app'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) => context
                    .read<CoinBloc>()
                    .add(CoinSearchEvent(keySearch: value)),
                decoration: const InputDecoration(
                  hintText: 'Search ...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            BlocBuilder<CoinBloc, CoinState>(
              builder: (context, state) {
                if (state is CoinLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CoinFailureState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is CoinLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.coinList.length,
                        itemBuilder: (context, index) {
                          final coin = state.coinList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    id: coin.id,
                                    coinEntity: coin,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                               leading: SizedBox(width: 50,height: 50,child: Image.network(coin.image)),
                              title: Text(coin.name.toString()),
                              subtitle: Text(coin.symbol.toString()),
                              trailing: Text(coin.priceChange24h.toString()),
                            ),
                          );
                        }),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
