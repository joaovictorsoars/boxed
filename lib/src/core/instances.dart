import 'package:boxed/src/core/constants/urls.dart';
import 'package:boxed/src/data/repositories/correios/correios_repository.dart';
import 'package:boxed/src/data/repositories/correios/token_correios_repository.dart';
import 'package:boxed/src/data/repositories/local_shipment/local_shipment_repository.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_cubit.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/get_events/get_shipment_events_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class Instances {
  static GetIt get it => GetIt.I;

  @pragma('vm:entry-point')
  static Future<void> instantiate() async {
    it.registerLazySingleton(() => const FlutterSecureStorage());
    it.registerLazySingleton(() => LocalShipmentRepository(storage: it.get()));

    it.registerLazySingleton(
        () => TokenCorreiosRepository(baseUrl: Urls.correiosApi));
    it.registerLazySingleton(() => TokenCorreiosCubit(
        storage: it.get(), tokenCorreiosRepository: it.get()));

    it.registerLazySingleton(() => CorreiosRepository(
          baseUrl: Urls.correiosApi,
          tokenCorreiosCubit: it.get(),
        ));
    it.registerLazySingleton(() => ShipmentCorreiosCubit(
        storage: it.get(),
        localShipmentRepository: it.get(),
        correiosRepository: it.get()));

    it.registerLazySingleton(() => ListingShipmentCubit(
        localShipmentRepository: it.get(), correiosRepository: it.get()));

    it.registerLazySingleton(() => GetShipmentEventsCubit(
        localShipmentRepository: it.get(), correiosRepository: it.get()));
  }
}
