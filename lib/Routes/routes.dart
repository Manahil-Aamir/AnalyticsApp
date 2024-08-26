import 'package:flutter/material.dart';
import 'package:visionproject/pages/signup.dart';
import 'package:visionproject/pages/splashscreen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String signup = '/signup';

  // Define a method to return the routes
  static Map<String, WidgetBuilder> define() {
    return {
      splash: (context) => const SplashPage(),
      signup: (context) => SignUpPage(),
    };
  }
}
