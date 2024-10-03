import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/network/end_points.dart';
import 'package:flutter_application_1/network/http.dart';

class Weather {
  final Http _http;

  const Weather({required Http http}) : _http = http;

  Future<void> invoke() async {
    Response response = await _http.getUri(EndPoints.weather);

    log(response.data);
  }
}
