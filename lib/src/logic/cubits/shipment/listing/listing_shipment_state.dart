import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:equatable/equatable.dart';

abstract class ListingShipmentState {}

class InitialListingShipmentState implements ListingShipmentState {}

class ListingShipmentsState implements ListingShipmentState {}

class ListedShipmentsState extends Equatable implements ListingShipmentState {
  final List<Shipment> shipments;

  const ListedShipmentsState(this.shipments);

  @override
  List<Object?> get props => [shipments];
}

class ErrorListingShipmentsState extends Equatable
    implements ListingShipmentState {
  final String message;

  const ErrorListingShipmentsState(this.message);

  @override
  List<Object?> get props => [message];
}

class GettingShipmentsLastEventState implements ListingShipmentState {}

class GettedShipmentsLastEventState implements ListingShipmentState {}

class GetShipmentsLastEventErrorState extends Equatable
    implements ListingShipmentState {
  final String? message;
  final int? code;

  const GetShipmentsLastEventErrorState(this.message, this.code);

  @override
  List<Object?> get props => [message, code];
}
