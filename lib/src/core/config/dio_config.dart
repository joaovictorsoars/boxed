import 'package:boxed/src/core/http/correios_interceptor.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_cubit.dart';
import 'package:dio/dio.dart';

abstract class DioConfig {
  static final dioConfig = Dio();

  static Dio getRotaCorreios(
    TokenCorreiosCubit tokenCorreiosCubit,
  ) {
    return dioConfig..interceptors.add(CorreiosInterceptor(tokenCorreiosCubit));
  }
}
