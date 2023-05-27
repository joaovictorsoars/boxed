import 'package:boxed/src/core/config/dio_config.dart';
import 'package:boxed/src/data/models/correios/shipment_objects.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_cubit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'correios_repository.g.dart';

@RestApi()
abstract class CorreiosRepository {
  factory CorreiosRepository({
    required String baseUrl,
    required TokenCorreiosCubit tokenCorreiosCubit,
  }) {
    return CorreiosRepository.retrofit(
      baseUrl: baseUrl,
      DioConfig.getRotaCorreios(tokenCorreiosCubit),
    );
  }

  factory CorreiosRepository.retrofit(
    Dio dio, {
    required String baseUrl,
  }) = _CorreiosRepository;

  @GET('/sro-rastro/{code}')
  Future<ShipmentObjects> track(@Path('code') String objectCode);
}
