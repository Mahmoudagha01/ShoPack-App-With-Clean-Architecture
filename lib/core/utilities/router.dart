
import 'package:flutter/material.dart';
import '../../features/login/presentation/view/login.dart';
import 'routes.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
      
    default:
    return MaterialPageRoute(builder: (context) => const LoginView());
      
  }
}
