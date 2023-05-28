import 'package:boxed/src/core/instances.dart';
import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/logic/cubits/shipment/get_events/get_shipment_events_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:boxed/src/presentation/pages/getting_started_page.dart';
import 'package:boxed/src/presentation/pages/home_page.dart';
import 'package:boxed/src/presentation/pages/shipment_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static const gettingStarted = 'getting_started';
  static const home = 'home';
  static const shipmentDetails = 'shipment_details';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gettingStarted:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const GettingStartedPage(),
        );
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<ListingShipmentCubit>.value(
            value: Instances.it.get(),
            child: const HomePage(),
          ),
        );
      case shipmentDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<GetShipmentEventsCubit>.value(
                value: Instances.it.get(),
              ),
              BlocProvider<ListingShipmentCubit>.value(
                  value: Instances.it.get()),
            ],
            child: ShipmentDetailsPage(
                shipment: (settings.arguments as Map)['shipment'] as Shipment),
          ),
        );
    }

    return null;
  }
}
