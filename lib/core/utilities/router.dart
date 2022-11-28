import 'package:flutter/material.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/views/forgotpassword.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/views/verifyemail.dart';
import 'package:shop_app/features/register/presentation/views/register.dart';
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
      return MaterialPageRoute(builder: (context) =>  ForgotPassword());  
       case AppRoutes.verifyEmail:
      return MaterialPageRoute(builder: (context) => const VerifyEmail());
      case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());  
    default:
    return MaterialPageRoute(builder: (context) => const LoginView());
      
  }
}
