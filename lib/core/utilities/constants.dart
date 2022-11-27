//ENDPOINTS
import 'package:flutter/material.dart';

//ENDPOINTS
const String baseUrlPath =
    'https://ecommerce-mernstack-dev.herokuapp.com/api/v1';
const String loginEndPoint = '/users/login';
const String registerEndPoint = '/users/register';
const String homeEndPoint = '/home';
const String getCatEndPoint = '/categories';
const String favoritesEndPoint = '/favorites';
const String profileEndPoint = '/profile';
const String productsDetailsEndPoint = '/products';
const String updateProfileEndPoint = '/update-profile';
const String searchEndPoint = 'products/search';
const String cartsEndPoint = '/carts';

//STRINGS
const String serverFailureMessage = 'Please try again later server is down.';
const String emptyCacheFailureMessage = 'No Data';
const String offlineFailureMessage = 'Please Check your Internet Connection';
const String tokenKey = 'tokenKey';


// Functin to show SnackBar
showSnackbar(String message, context, Color color) {
  final snackbar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
