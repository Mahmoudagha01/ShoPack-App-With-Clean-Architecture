part of 'send_review_bloc.dart';

abstract class SendReviewState extends Equatable {
  const SendReviewState();

  @override
  List<Object> get props => [];
}

class SendReviewInitial extends SendReviewState {}

class SendReviewLoadingState extends SendReviewState {}

class SendReviewLoadedState extends SendReviewState {
  final ResponseEntity data;

  const SendReviewLoadedState(this.data);
}

class SendReviewErrorState extends SendReviewState {
  final String message;

  const SendReviewErrorState(this.message);
}

class GetAllReviewsLoadingState extends SendReviewState {}

class GetAllReviewsLoadedState extends SendReviewState {
  final GetReviewsEntity data;

  const GetAllReviewsLoadedState(this.data);
}

class GetAllReviewsErrorState extends SendReviewState {
  final String message;

  const GetAllReviewsErrorState(this.message);
}