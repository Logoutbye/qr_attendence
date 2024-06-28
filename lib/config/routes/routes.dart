import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/view/splash_screen.dart';

import 'slide_transition_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return SlideTransitionPage(page: const SplashScreen());

      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
