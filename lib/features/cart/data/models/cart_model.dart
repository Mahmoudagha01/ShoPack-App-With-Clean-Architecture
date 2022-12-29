


import 'package:hive/hive.dart';

part 'cart_model.g.dart';
@HiveType(typeId: 4)
class CartProduct{
   @HiveField(0)
  final String id;
   @HiveField(1)
  final String name;
   @HiveField(2)
  final String description;
     @HiveField(3)
  final int price;
   @HiveField(4)
  final num ratings;
   @HiveField(5)
  final String productImage;
   @HiveField(6)
  final String category;
   @HiveField(7)
  final int stock;
   @HiveField(8)
  final int numOfReviews;
   @HiveField(9)
  final String user;
   @HiveField(10)
  bool isFavourite =false;
     @HiveField(11)
   num amount =1;
   CartProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ratings,
    required this.productImage,
    required this.category,
    required this.stock,
    required this.numOfReviews,
    required this.user,
     this.isFavourite= false,
this.amount=0,
  });

  
  
}
