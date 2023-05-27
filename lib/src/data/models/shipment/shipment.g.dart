// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      name: json['name'] as String,
      code: json['code'] as String,
      company: json['company'] as String,
      lastEvent: json['lastEvent'] as String,
      lastEventDescription: json['lastEventDescription'] as String,
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'company': instance.company,
      'lastEvent': instance.lastEvent,
      'lastEventDescription': instance.lastEventDescription,
    };
