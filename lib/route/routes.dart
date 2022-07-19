import 'package:ahmed_test_flutter/view/home_view.dart';
import 'package:flutter/material.dart';

import '../view/signup_view.dart';

class Routes {
  static const String signUp = 'signup_screen';
  static const String home = 'home_sceen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());

      case home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("Route name doesn't exists"),
            ),
          );
        });
    }
  }
}
