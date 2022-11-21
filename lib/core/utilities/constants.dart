//ENDPOINTS
import '../error/failure.dart';

const String baseUrlPath = 'https://student.valuxapps.com/api/';
const String loginEndPoint = '/login';
const String registerEndPoint = '/register';
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

// Function To Handle Error Message
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case OfflineFailure:
      return offlineFailureMessage;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
