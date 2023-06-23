import 'package:dartz/dartz.dart';
import '../domain.dart';
import 'package:crypto_tracker_bloc/common/common.dart';

class GetCoinsUseCase
    implements BaseUseCases<List<CoinEntity>, NoParameters> {
  final CoinRepository coinRepository;

  const GetCoinsUseCase({
    required this.coinRepository,
  });

  @override
  Future<Either<Failure, List<CoinEntity>>> call(NoParameters noParameters) async {
    return await coinRepository.getCoins();
  }
}
