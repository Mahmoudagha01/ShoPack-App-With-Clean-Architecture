part of 'send_review_bloc.dart';

abstract class SendReviewEvent extends Equatable {
  const SendReviewEvent();

  @override
  List<Object> get props => [];
}

class SendReview extends SendReviewEvent {
  final String productId;
  final String comment;
  final num rating;

  const SendReview(this.productId, this.comment, this.rating);
}

class GetReviews extends SendReviewEvent {
  final String productId;

  const GetReviews(this.productId);
}
