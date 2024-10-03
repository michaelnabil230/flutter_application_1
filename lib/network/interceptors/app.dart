import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/network/exceptions/not_found.dart';
import 'package:flutter_application_1/network/exceptions/validation.dart';

class App extends Interceptor {
  const App();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('REQUEST[${options.method}] => PATH: ${options.path}');

    options.headers.addAll({
      HttpHeaders.acceptHeader: Headers.jsonContentType,
      HttpHeaders.acceptLanguageHeader: 'en',
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    if (err.type == DioExceptionType.connectionError) {
      // return _onDisconnect();
    }

    if (err.response?.statusCode == HttpStatus.internalServerError) {
      // return _onServerError();
    }

    if (err.response?.statusCode == HttpStatus.notFound) {
      return super.onError(
        NotFound(
          response: err.response,
          requestOptions: err.requestOptions,
        ),
        handler,
      );
    }

    if (err.response?.statusCode == HttpStatus.unprocessableEntity) {
      return super.onError(
        Validation(
          response: err.response,
          requestOptions: err.requestOptions,
        ),
        handler,
      );
    }

    return super.onError(err, handler);
  }
}
