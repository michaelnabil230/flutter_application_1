import 'package:dio/io.dart';
import 'package:flutter_application_1/network/end_points.dart';
import 'package:flutter_application_1/network/interceptors/index.dart';

class Http extends DioForNative {
  Http() {
    options
      ..baseUrl = EndPoints.domain
      ..followRedirects = false;

    interceptors.addAll([
      App(),
    ]);
  }
}
