import 'package:shopack_user/features/shop/data/models/reviews_model.dart';
import '../../../../core/local/shared_preference.dart';
import '../../../../core/network/api_provider.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/products_model.dart';
import '../models/response_model.dart';

abstract class ProductsDatasource {
  Future<ProductsModel> getAllProducts();
  Future<ProductsModel> getSpecificProduct(GetProductParams params);
  Future<ResponseModel> sendReview(SendReviewParams params);
  Future<GetReviewsModel> getReviews(GetReviewsParams params);
}

class ProductsDatasourceImpl implements ProductsDatasource {
  final APIProvider apiProvider;

  ProductsDatasourceImpl(this.apiProvider);
  @override
  Future<ProductsModel> getAllProducts() async {
    final response = await apiProvider.get(endPoint: productsEndPoint);
    return ProductsModel.fromJson(response.data);
  }

  @override
  Future<ProductsModel> getSpecificProduct(GetProductParams params) async {
    final response = await apiProvider.get(endPoint: productsEndPoint, query: {
      "category": params.category,
      "price[gt]": params.minPrice,
      "price[lt]": params.maxPrice,
      "ratings[gt]": params.rate,
      "keyword": params.keyword,
    });
    return ProductsModel.fromJson(response.data);
  }

  @override
  Future<ResponseModel> sendReview(SendReviewParams params) async {
    final response = await apiProvider.put(
        endPoint: getAllReviewsEndPoint,
        data: {
          'productId': params.productId,
          'comment': params.comment,
          'rating': params.rating,
        },
        token:
            PreferenceHelper.getDataFromSharedPreference(key: 'token') ?? '');
    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<GetReviewsModel> getReviews(GetReviewsParams params) async {
    final response = await apiProvider.get(
      endPoint: "$reviewEndPoint?id=${params.productId}",
    );
    return GetReviewsModel.fromJson(response.data);
  }
}
