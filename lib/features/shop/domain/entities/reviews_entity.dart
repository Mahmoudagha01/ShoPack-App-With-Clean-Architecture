import 'package:equatable/equatable.dart';

class GetReviewsEntity extends Equatable {
  final bool success;
  final List<GetReviewEntity>? reviews;

  const GetReviewsEntity(this.success, this.reviews);

  @override
  List<Object?> get props => [success, reviews];
}

class GetReviewEntity extends Equatable {
  final String? user;
  final String? name;
  final num? rating;
  final String? comment;
  final DateTime? createdAt;
  const GetReviewEntity(
      this.user, this.name, this.rating, this.comment, this.createdAt);

  @override
  List<Object?> get props => [user, name, rating, comment];
}
