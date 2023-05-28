import 'package:equatable/equatable.dart';

abstract class ShipmentCorreiosState {}

class InitialCorreiosState implements ShipmentCorreiosState {}

class AddingShipmentCorreiosState implements ShipmentCorreiosState {}

class AddedShipmentCorreiosState extends Equatable
    implements ShipmentCorreiosState {
  final String shipmentCode;

  const AddedShipmentCorreiosState(this.shipmentCode);

  @override
  List<Object?> get props => [shipmentCode];
}

class AddShipmentErrorState extends Equatable implements ShipmentCorreiosState {
  final String? message;
  final int? code;

  const AddShipmentErrorState(this.message, this.code);

  @override
  List<Object?> get props => [message, code];
}
