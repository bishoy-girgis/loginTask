import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_login/Core/config/page_route_name.dart';
import 'package:task_login/Features/Login/pages/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageRouteName.login:
        return MaterialPageRoute<dynamic>(
            builder: (context) =>  LoginView()  , settings: routeSettings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) =>  LoginView() , settings: routeSettings);
    }
  }
}
