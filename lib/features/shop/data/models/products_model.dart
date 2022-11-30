import 'package:shop_app/features/shop/domain/entities/products_entity.dart';

class ProductsModel extends Productsentity {
  const ProductsModel(
      super.success, super.products, super.filteredProductsCount);

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      json['success'],
      List<ProductModel>.from(
          json['products'].map((x) => ProductModel.fromJson(x))),
      json['filteredProductsCount']);
}

class ProductModel extends ProductEntity {
  const ProductModel(
      super.id,
      super.name,
      super.description,
      super.images,
      super.category,
      super.user,
      super.price,
      super.stock,
      super.numOfReviews,
      super.ratings,
      super.reviews);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        json['_id'],
        json['name'],
        json['description'],
        List<ImageModel>.from(
            json['images'].map((x) => ImageModel.fromJson(x))),
        json['category'],
        json['user'],
        json['price'],
        json['stock'],
        json['numOfReviews'],
        json['ratings'],
        List<ReviewModel>.from(
            json['reviews'].map((x) => ReviewModel.fromJson(x))),
      );
}

class ImageModel extends ImageEntity {
  const ImageModel(super.publicid, super.url);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(json['publicid'], json['url']);
}

class ReviewModel extends ReviewEntity {
  const ReviewModel(super.user, super.name, super.comment, super.rating);
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewModel(json["user"], json['name'], json['comment'], json['rating']);
}
