import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment.g.dart';

@JsonSerializable()
class Shipment extends Equatable {
  final String name;
  final String code;
  final String company;

  const Shipment({
    required this.name,
    required this.code,
    required this.company,
  });

  @override
  List<Object?> get props => [name, code, company];

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}
