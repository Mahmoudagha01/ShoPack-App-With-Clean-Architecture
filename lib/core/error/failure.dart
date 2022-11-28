import 'package:equatable/equatable.dart';

 class Failure extends Equatable {
 final String message;
  const Failure(
    this.message,
  );

  @override
  List<Object> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure(
    super.message,
  );

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object> get props => [message];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);

  @override
  List<Object> get props => [message];
}
