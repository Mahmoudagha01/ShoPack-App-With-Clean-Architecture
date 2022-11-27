import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message;
  Failure(
    this.message,
  );

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  OfflineFailure(
    super.message,
  );

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(super.statusCode);

  @override
  List<Object> get props => [message];
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.statusCode);

  @override
  List<Object> get props => [message];
}
