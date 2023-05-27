import 'package:boxed/src/data/models/correios/correios_shipment.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment_objects.g.dart';

@JsonSerializable()
class ShipmentObjects extends Equatable {
  final List<CorreiosShipment> objetos;
  final int quantidade;
  final String resultado;
  final String versao;

  const ShipmentObjects({
    required this.objetos,
    required this.quantidade,
    required this.resultado,
    required this.versao,
  });

  @override
  List<Object?> get props => [objetos, quantidade, resultado, versao];

  factory ShipmentObjects.fromJson(Map<String, dynamic> json) =>
      _$ShipmentObjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentObjectsToJson(this);
}
