import 'package:boxed/src/data/models/correios/address.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit extends Equatable {
  final Address? endereco;
  final String? nome;
  final String? tipo;

  const Unit({this.endereco, this.nome, this.tipo});

  @override
  List<Object?> get props => [endereco, nome, tipo];

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
