import 'package:boxed/src/data/models/correios/event.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'correios_shipment.g.dart';

@JsonSerializable()
class CorreiosShipment extends Equatable {
  final String codObjeto;
  final List<Event> eventos;

  const CorreiosShipment({
    required this.codObjeto,
    required this.eventos,
  });

  @override
  List<Object?> get props => [codObjeto, eventos];

  factory CorreiosShipment.fromJson(Map<String, dynamic> json) =>
      _$CorreiosShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$CorreiosShipmentToJson(this);
}
