
import 'package:flutter/material.dart';
import 'package:listapp/routes/routeNames.dart';
import 'package:listapp/screens/login_page.dart';
import 'package:listapp/screens/signup_page.dart';

import '../screens/home_page.dart';
import '../screens/splash_screen.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());

      case RouteName.loginPage:
        return MaterialPageRoute(builder: (context)=>const LoginPage());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (context)=>const SignUpPage());

      case RouteName.homePage:
        return MaterialPageRoute(builder: (context)=>const HomePage());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}