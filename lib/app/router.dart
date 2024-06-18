import 'package:flutter/material.dart';
import 'package:clean_code_ruan/presentation/screens/user_screen.dart';

import '../presentation/screens/user_screen.dart';
// Import other screens here

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => UserScreen());
    // Add other cases for different routes
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
