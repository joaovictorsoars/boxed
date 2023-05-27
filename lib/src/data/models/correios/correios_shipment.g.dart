// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correios_shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorreiosShipment _$CorreiosShipmentFromJson(Map<String, dynamic> json) =>
    CorreiosShipment(
      codObjeto: json['codObjeto'] as String,
      eventos: (json['eventos'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CorreiosShipmentToJson(CorreiosShipment instance) =>
    <String, dynamic>{
      'codObjeto': instance.codObjeto,
      'eventos': instance.eventos,
    };
