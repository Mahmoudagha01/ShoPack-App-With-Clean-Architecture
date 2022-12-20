import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/shop/domain/usecases/sendReview_usecase.dart';

import '../../domain/entities/response_entity.dart';

part 'send_review_event.dart';
part 'send_review_state.dart';

class SendReviewBloc extends Bloc<SendReviewEvent, SendReviewState> {
  final SendReviewUsecase sendReviewUsecase;
  SendReviewBloc(this.sendReviewUsecase) : super(SendReviewInitial()) {
    on<SendReview>((event, emit) async {
      emit(SendReviewLoadingState());
      final failurOrSuccess = await sendReviewUsecase(
        SendReviewUsecaseParams(
          event.productId,
          event.comment,
          event.rating,
        ),
      );

      failurOrSuccess.fold(
          (failure) => emit(SendReviewErrorState(failure.message)),
          (success) => emit(SendReviewLoadedState(success)));
    });
  }
}
