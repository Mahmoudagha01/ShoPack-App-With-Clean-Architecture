
import '../../domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  const ProductsModel(super.success, super.products, super.filteredProductsCount);
  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      json['success'],
      List<ProductModel>.from(
          json['products'].map((x) => ProductModel.fromJson(x))),
      json['filteredProductsCount']);
}

class ProductModel extends ProductEntity {
   ProductModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      required super.ratings,
      required super.images,
      required super.category,
      required super.stock,
      required super.numOfReviews,
      required super.user,
      required super.reviews,

       super.isFavourite});
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        ratings: json['ratings'],
        images: List<ImageModel>.from(
            json['images'].map((x) => ImageModel.fromJson(x))),
        category: json['category'],
        stock: json['stock'],
        numOfReviews: json['numOfReviews'],
        user: json['user'],
        reviews: List<ReviewModel>.from(
            json['reviews'].map((x) => ReviewModel.fromJson(x)))
      );
}

class ImageModel extends ImageEntity {
  const ImageModel(super.publicid, super.url);
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(json['public_id'], json['url']);
}

class ReviewModel extends ReviewEntity {
  const ReviewModel(super.user, super.name,super.rating, super.comment,super.createdAt);
  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        json["user"] ?? "",
        json['name'] ?? "",
  json['rating']??0,
        json['comment'] ?? "",
       DateTime.parse(json['createdAt']) 
      );
}
