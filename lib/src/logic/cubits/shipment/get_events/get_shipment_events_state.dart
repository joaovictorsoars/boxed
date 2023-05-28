import 'package:boxed/src/data/models/correios/event.dart';
import 'package:equatable/equatable.dart';

abstract class GetShipmentEventsState {}

class InitialGetShipmentEventsState implements GetShipmentEventsState {}

class GettingShipmentEventsState implements GetShipmentEventsState {}

class GettedShipmentEventsState extends Equatable
    implements GetShipmentEventsState {
  final List<Event> shipmentEvent;

  const GettedShipmentEventsState(this.shipmentEvent);

  @override
  List<Object?> get props => [shipmentEvent];
}

class GetShipmentEventsErrorState extends Equatable
    implements GetShipmentEventsState {
  final String? message;
  final int? code;

  const GetShipmentEventsErrorState(this.message, this.code);

  @override
  List<Object?> get props => [message, code];
}

class ErasingShipmentState implements GetShipmentEventsState {}

class ErasedShipmentState implements GetShipmentEventsState {}
