import 'package:dio/dio.dart';

class NotFound extends DioException {
  NotFound({
    required super.response,
    required super.requestOptions,
  });

  @override
  String toString() => 'Not Found';
}
