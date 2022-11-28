import 'package:flutter/material.dart';

//ENDPOINTS
const String baseUrlPath =
    'https://ecommerce-mernstack-dev.herokuapp.com/api/v1';
const String loginEndPoint = '/users/login';
const String registerEndPoint = '/users/register';
const String forgotPasswordEndPoint = '/users/password/forgot';
const String homeEndPoint = '/home';
const String getCatEndPoint = '/categories';
const String favoritesEndPoint = '/favorites';
const String profileEndPoint = '/profile';
const String productsDetailsEndPoint = '/products';
const String updateProfileEndPoint = '/update-profile';
const String searchEndPoint = 'products/search';
const String cartsEndPoint = '/carts';

// Functin to show SnackBar
showSnackbar(String message, context, Color color) {
  final snackbar = SnackBar(
    content: Text(message,style: const TextStyle(fontWeight: FontWeight.bold),),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
