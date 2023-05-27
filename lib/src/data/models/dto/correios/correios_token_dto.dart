import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'correios_token_dto.g.dart';

@JsonSerializable()
class CorreiosTokenDTO extends Equatable {
  final String token;

  const CorreiosTokenDTO({required this.token});

  @override
  List<Object?> get props => [token];

  factory CorreiosTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$CorreiosTokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CorreiosTokenDTOToJson(this);
}
