import 'package:boxed/src/core/config/dio_config.dart';
import 'package:boxed/src/data/models/dto/correios/correios_request_token_dto.dart';
import 'package:boxed/src/data/models/dto/correios/correios_token_dto.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'token_correios_repository.g.dart';

@RestApi()
abstract class TokenCorreiosRepository {
  factory TokenCorreiosRepository({
    required String baseUrl,
  }) {
    return TokenCorreiosRepository.retrofit(
        baseUrl: baseUrl, DioConfig.dioConfig);
  }

  factory TokenCorreiosRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _TokenCorreiosRepository;

  @POST('/app-validation')
  Future<CorreiosTokenDTO> token(@Body() CorreiosRequestTokenDTO token);
}
