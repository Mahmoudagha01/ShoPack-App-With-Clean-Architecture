import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/response_entity.dart';
import '../repositories/product_repository.dart';

class SendReviewUsecase extends BaseUsecase<ResponseEntity, SendReviewUsecaseParams> {
  final ProductRepository productRepository;

  SendReviewUsecase(this.productRepository);
  @override
  Future<Either<Failure, ResponseEntity>> call(SendReviewUsecaseParams params) async {
    return await productRepository.sendReview(SendReviewParams(params.productId, params.comment, params.rating));
  }
}

class SendReviewUsecaseParams {
  final String productId;
  final String comment;
  final num rating;

  SendReviewUsecaseParams(this.productId, this.comment, this.rating);
}
