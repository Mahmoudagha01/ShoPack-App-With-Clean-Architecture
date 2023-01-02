import 'package:equatable/equatable.dart';

class PaymentRequestEntity extends Equatable {
  final String token;
  const PaymentRequestEntity({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
