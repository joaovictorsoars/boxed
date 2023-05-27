import 'dart:convert';

import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalShipmentRepository {
  final FlutterSecureStorage storage;

  const LocalShipmentRepository({required this.storage});

  Future<void> addShipment(Shipment shipment) async {
    var actualShipmentsJson = await storage.read(key: StorageKeys.shipments);

    if (actualShipmentsJson != null) {
      List<dynamic> actualShipments = json.decode(actualShipmentsJson);
      actualShipments.add(shipment);
      await storage.write(
          key: StorageKeys.shipments, value: json.encode(actualShipments));
    } else {
      await storage.write(
          key: StorageKeys.shipments, value: json.encode([shipment]));
    }
  }

  Future<void> setShipments(List<Shipment> shipments) async {
    await storage.write(
        key: StorageKeys.shipments, value: json.encode(shipments));
  }

  Future<List<Shipment>> getShipments() async {
    var shipmentsFromStorage = await storage.read(key: StorageKeys.shipments);

    if (shipmentsFromStorage == null) {
      return [];
    }

    List<dynamic> shipments = json.decode(shipmentsFromStorage);

    return shipments
        .map((e) => Shipment(
            name: e['name'],
            code: e['code'],
            company: e['company'],
            lastEvent: e['lastEvent'],
            lastEventDescription: e['lastEventDescription']))
        .toList();
  }
}
