import 'package:equatable/equatable.dart';

class OrderRequest extends Equatable {
  final int id;

  const OrderRequest({
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      id,
    ];
  }
}
