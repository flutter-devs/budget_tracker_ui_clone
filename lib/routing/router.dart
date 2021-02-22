
import 'package:budget_tracker_ui_clone/routing/routes.dart';
import 'package:budget_tracker_ui_clone/screens/dasboard.dart';
import 'package:budget_tracker_ui_clone/screens/login_screen.dart';
import 'package:budget_tracker_ui_clone/screens/on_boarding.dart';
import 'package:budget_tracker_ui_clone/screens/splash_screen.dart';
import 'package:flutter/material.dart';



class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SplashRoute:
        return _getPageRoute(Splash(), settings);
      case Routes.DashBoard:
        return _getPageRoute(Dashboard(), settings);
      case Routes.Login:
        return _getPageRoute(LoginScreen(), settings);
      case Routes.OnBoarding:
        return _getPageRoute(OnBoarding(), settings);


      default:
      //return _getPageRoute(HomeView(), settings);
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }

  static PageRoute _getPageRoute(Widget child, RouteSettings settings) {
    return _FadeRoute(
        child: child, routeName: settings.name, arguments: settings.arguments);
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  final Object arguments;

  _FadeRoute({this.child, this.routeName, this.arguments})
      : super(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
