import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureMessage;

  const Failure({
    required this.failureMessage,
  });

  @override
  List<Object> get props => [failureMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required failureMessage}) : super(failureMessage: '');
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required failureMessage}) : super(failureMessage: '');
}
