import 'package:boxed/src/core/instances.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/shipment_cubit.dart';
import 'package:boxed/src/presentation/pages/getting_started_page.dart';
import 'package:boxed/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static const gettingStarted = 'getting_started';
  static const home = 'home';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route onGenerateRoute(RouteSettings settings) {
    final routes = {
      gettingStarted: const GettingStartedPage(),
      home: BlocProvider<ShipmentCubit>.value(
        value: Instances.it.get(),
        child: const HomePage(),
      ),
    };

    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!,
    );
  }
}
