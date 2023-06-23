import 'package:crypto_tracker_bloc/domain/domain.dart';
import 'package:dartz/dartz.dart';
import '../../common/common.dart';

class CoinChartUseCase {
  final CoinRepository coinRepository;

  const CoinChartUseCase({
    required this.coinRepository,
  });

  Future<Either<Failure, List<PriceAndTimeEntity>>> call(String name, String day) async {
    return await coinRepository.getCoiChart(name, day);
  }
}
