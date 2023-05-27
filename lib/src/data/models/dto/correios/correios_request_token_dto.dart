import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'correios_request_token_dto.g.dart';

@JsonSerializable()
class CorreiosRequestTokenDTO extends Equatable {
  final String requestToken;

  const CorreiosRequestTokenDTO({required this.requestToken});

  @override
  List<Object?> get props => [requestToken];

  factory CorreiosRequestTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$CorreiosRequestTokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CorreiosRequestTokenDTOToJson(this);
}
