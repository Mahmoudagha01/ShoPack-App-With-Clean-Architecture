import 'package:equatable/equatable.dart';

class Productsentity extends Equatable {
  final bool success;
  final List<ProductEntity> products;
  final int filteredProductsCount;

  const Productsentity(this.success, this.products, this.filteredProductsCount);

  @override
  
  List<Object> get props => [success, products, filteredProductsCount];
}

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<ImageEntity> images;
  final String category;
  final String user;
  final int price;
  final int stock;
  final int numOfReviews;
  final double ratings;
  final List<ReviewEntity> reviews;

  const ProductEntity(this.id, this.name, this.description, this.images, this.category, this.user, this.price, this.stock, this.numOfReviews, this.ratings, this.reviews);

  @override
 
  List<Object> get props {
    return [
      id,
      name,
      description,
      images,
      category,
      user,
      price,
      stock,
      numOfReviews,
      ratings,
      reviews,
    ];
  }
}

class ImageEntity extends Equatable {
  final String publicid;
  final String url;

  const ImageEntity(this.publicid, this.url);
  @override
  List<Object> get props => [publicid, url];
}

class ReviewEntity extends Equatable {
  final String user;
  final String name;
  final String comment;
  final int rating;

   const ReviewEntity(this.user, this.name, this.comment, this.rating);
  @override
 
  List<Object> get props => [user, name, comment, rating];
}
