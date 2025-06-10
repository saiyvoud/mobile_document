import 'package:flutter/material.dart';
import 'package:mobile_document/view/auth/Login.dart';
import 'package:mobile_document/view/auth/Register.dart';



class RouterAPI {
  static const splashScreen = "/";
  static const bottombar = "/bottombar";
  static const home = "/home";
  static const login = "/login";
  static const register = "/register";



  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => RegisterView(),
        );
      default:
        throw const FormatException("Route not found! check routes again!");
    }
  }
}