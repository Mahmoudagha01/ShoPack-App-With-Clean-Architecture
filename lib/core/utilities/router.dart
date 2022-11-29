import 'package:flutter/material.dart';
import 'package:shop_app/features/forgotpass&verifyemail/presentation/views/forgotpassword.dart';
import 'package:shop_app/features/home/presentation/view/layout.dart';
import 'package:shop_app/features/setpassword/presentation/views/setpassword.dart';
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
      return MaterialPageRoute(builder: (context) =>  const ForgotPassword());  
       case AppRoutes.setPassword:
      return MaterialPageRoute(builder: (context) => const SetPassword());
      case AppRoutes.layout:
      return MaterialPageRoute(builder: (context) => const Layout());  
      case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());  
    default:
    return MaterialPageRoute(builder: (context) => const LoginView());
      
  }
}
