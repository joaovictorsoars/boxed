// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      codigo: json['codigo'] as String,
      descricao: json['descricao'] as String,
      dtHrCriado: DateTime.parse(json['dtHrCriado'] as String),
      tipo: json['tipo'] as String,
      unidade: Unit.fromJson(json['unidade'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'dtHrCriado': instance.dtHrCriado.toIso8601String(),
      'tipo': instance.tipo,
      'unidade': instance.unidade,
    };
