import 'dart:convert';

import 'package:boxed/src/core/constants/env_variables.dart';
import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:boxed/src/data/models/dto/correios/correios_request_token_dto.dart';
import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/data/repositories/correios/correios_repository.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShipmentCorreiosCubit extends Cubit<ShipmentCorreiosState> {
  final FlutterSecureStorage storage;
  final CorreiosRepository correiosRepository;

  ShipmentCorreiosCubit({
    required this.storage,
    required this.correiosRepository,
  }) : super(InitialCorreiosState());

  Future<void> addShipment(Shipment shipment) async {
    try {
      emit(AddingShipmentCorreiosState());

      var shipmentObjects = await correiosRepository.track(shipment.code);

      var actualShipmentsJson = await storage.read(key: StorageKeys.shipments);

      if (actualShipmentsJson != null) {
        var actualShipments = json.decode(actualShipmentsJson);
        actualShipments.add(shipment);
        await storage.write(
            key: StorageKeys.shipments, value: json.encode(actualShipments));
      } else {
        await storage.write(
            key: StorageKeys.shipments, value: json.encode([shipment]));
      }

      emit(AddedShipmentCorreiosState(shipment.code));
    } catch (e) {
      print(e);

      String? message;
      int? code;

      if (e is DioError) {
        message = e.response!.statusMessage;
        code = e.response?.statusCode;
      } else {
        message = 'Objeto não existe!';
        code = 400;
      }

      emit(AddShipmentErrorState(message, code));
    }
  }
}
