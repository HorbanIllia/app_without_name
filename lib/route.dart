import 'package:app_without_name/screens/createitem_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'constants.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/carousel_info_screen.dart';
import 'screens/reset_pass_screen.dart';
import 'screens/new_pass_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/terms_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashViewRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case CarouselInfoViewRoute:
        return MaterialPageRoute(builder: (context) => CarouselInfoScreen());
      case HomeViewRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case LoginViewRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case ResetPassViewRoute:
        return MaterialPageRoute(builder: (context) => ResetPassScreen());
      case NewPassViewRoute:
        return MaterialPageRoute(builder: (context) => NewPassScreen());
      case RegistrationViewRoute:
        return MaterialPageRoute(builder: (context) => RegistrationScreen());
      case TermsViewRoute:
        return MaterialPageRoute(builder: (context) => TermsScreen());
      case CreateItemRoute:
        return MaterialPageRoute(builder: (context) => CreateItemScreen());
      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}