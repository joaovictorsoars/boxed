import 'package:boxed/src/presentation/pages/getting_started_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const gettingStarted = 'getting_started';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    final routes = {
      gettingStarted: const GettingStartedPage(),
    };

    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!,
    );
  }
}
