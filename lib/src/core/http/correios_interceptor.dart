import 'package:boxed/src/core/config/dio_config.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_cubit.dart';
import 'package:dio/dio.dart';

class CorreiosInterceptor extends Interceptor {
  final TokenCorreiosCubit tokenCorreiosCubit;

  const CorreiosInterceptor(
    this.tokenCorreiosCubit,
  );

  Future<Response<dynamic>> retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return DioConfig.dioConfig.request<dynamic>(
      requestOptions.baseUrl + requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      await tokenCorreiosCubit.saveToken();
      var response = await retryRequest(err.requestOptions);

      return handler.resolve(response);
    }

    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await tokenCorreiosCubit.token;

    options.headers['user-agent'] = 'Dart/2.18 (dart:io)';
    options.headers['app-check-token'] = '$token';

    super.onRequest(options, handler);
  }
}
