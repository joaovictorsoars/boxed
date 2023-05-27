import 'package:boxed/src/data/models/correios/unit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event extends Equatable {
  final String codigo;
  final String descricao;
  final DateTime dtHrCriado;
  final String tipo;
  final Unit unidade;

  const Event({
    required this.codigo,
    required this.descricao,
    required this.dtHrCriado,
    required this.tipo,
    required this.unidade,
  });

  @override
  List<Object?> get props => [codigo, descricao, dtHrCriado, tipo, unidade];

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
