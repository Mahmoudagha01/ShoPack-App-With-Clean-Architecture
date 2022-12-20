
import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  final bool success;
  final String? message;

  const ResponseEntity(this.success, this.message);
  
  @override
  
  List<Object?> get props => [success, message];
}
