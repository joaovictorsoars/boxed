import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:equatable/equatable.dart';

abstract class ShipmentState {}

class InitialShipmentState implements ShipmentState {}

class ListingShipmentsState implements ShipmentState {}

class ListedShipmentsState extends Equatable implements ShipmentState {
  final List<Shipment> shipments;

  const ListedShipmentsState(this.shipments);

  @override
  List<Object?> get props => [shipments];
}

class ErrorListingShipmentsState extends Equatable implements ShipmentState {
  final String message;

  const ErrorListingShipmentsState(this.message);

  @override
  List<Object?> get props => [message];
}

class GettingShipmentsLastEventState implements ShipmentState {}

class GettedShipmentsLastEventState implements ShipmentState {}

class GetShipmentsLastEventErrorState extends Equatable
    implements ShipmentState {
  final String? message;
  final int? code;

  const GetShipmentsLastEventErrorState(this.message, this.code);

  @override
  List<Object?> get props => [message, code];
}
