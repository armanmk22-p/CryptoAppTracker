import 'package:dartz/dartz.dart';
import 'package:crypto_tracker_bloc/common/common.dart';

abstract class BaseUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

//useCase when fun not need parameters
class NoParameters {
  const NoParameters();
}
