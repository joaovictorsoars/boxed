// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      endereco: json['endereco'] == null
          ? null
          : Address.fromJson(json['endereco'] as Map<String, dynamic>),
      nome: json['nome'] as String?,
      tipo: json['tipo'] as String?,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'endereco': instance.endereco,
      'nome': instance.nome,
      'tipo': instance.tipo,
    };
