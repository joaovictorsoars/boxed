// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentObjects _$ShipmentObjectsFromJson(Map<String, dynamic> json) =>
    ShipmentObjects(
      objetos: (json['objetos'] as List<dynamic>)
          .map((e) => CorreiosShipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantidade: json['quantidade'] as int,
      resultado: json['resultado'] as String,
      versao: json['versao'] as String,
    );

Map<String, dynamic> _$ShipmentObjectsToJson(ShipmentObjects instance) =>
    <String, dynamic>{
      'objetos': instance.objetos,
      'quantidade': instance.quantidade,
      'resultado': instance.resultado,
      'versao': instance.versao,
    };
