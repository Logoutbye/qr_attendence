import 'package:flutter/material.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/view/common/select_role.dart';
import 'package:qr_attendence/view/screens/Host/create_Event.dart';
import 'package:qr_attendence/view/screens/Host/create_people.dart';
import 'package:qr_attendence/view/screens/Host/host_dashboard.dart';
import 'package:qr_attendence/view/screens/Host/list_of_current_event.dart';
import 'package:qr_attendence/view/screens/Host/signin_host.dart';
import 'package:qr_attendence/view/screens/Host/signup_host.dart';
import 'package:qr_attendence/view/screens/employes/employes_checkin.dart';
import 'package:qr_attendence/view/splash_screen.dart';

import 'slide_transition_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return SlideTransitionPage(page: const SplashScreen());
           case RoutesName.selectRole:
        return SlideTransitionPage(page: const SelectRole());
           case RoutesName.signUp:
        return SlideTransitionPage(page: const SignUpHost());
         case RoutesName.signin:
        return SlideTransitionPage(page: SignInHost());
        case RoutesName.createEvent:
        return SlideTransitionPage(page: CreateEventScreen());
        case RoutesName.createPeople:
        return SlideTransitionPage(page: PeopleScreen());
        case RoutesName.employCheckin:
        return SlideTransitionPage(page: Employescheckin());
        case RoutesName.hostDashboard:
        return SlideTransitionPage(page: DashBoardHost());
          case RoutesName.listOfCurrentEvent:
        return SlideTransitionPage(page: ListOfCurrentEvent());
        

      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}