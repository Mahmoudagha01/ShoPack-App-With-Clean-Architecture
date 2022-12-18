import 'package:flutter/material.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/views/forgotpassword.dart';
import 'package:shop_app/features/home/presentation/view/layout.dart';
import 'package:shop_app/features/home/presentation/view/product_details.dart';
import 'package:shop_app/features/profile/domain/entities/profile_entity.dart';
import 'package:shop_app/features/profile/presentation/views/updatePass.dart';
import 'package:shop_app/features/profile/presentation/views/updateprofile.dart';
import 'package:shop_app/features/setpassword/presentation/views/setpassword.dart';
import 'package:shop_app/features/register/presentation/views/register.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import '../../features/home/presentation/view/home.dart';
import '../../features/login/presentation/view/login.dart';
import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(builder: (context) => const ForgotPassword());
    case AppRoutes.setPassword:
      return MaterialPageRoute(builder: (context) => const SetPassword());
    case AppRoutes.layout:
      return MaterialPageRoute(builder: (context) => const LayoutPage());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AppRoutes.productDetails:
      final product = settings.arguments as ProductEntity;
      final products = settings.arguments as List<ProductEntity>;
      return MaterialPageRoute(builder: (context) =>  ProductDetails(product: product,products: products,));
      case AppRoutes.updateProfile:
        final user = settings.arguments as UserEntity;
      return MaterialPageRoute(builder: (context) =>  UpdateProfileView(user: user,));
      case AppRoutes.updatePassword:
      return MaterialPageRoute(builder: (context) => const UpdatePasswordView());
    default:
      return MaterialPageRoute(builder: (context) => const LoginView());
  }
}
