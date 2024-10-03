import 'package:dio/dio.dart';

class Validation extends DioException {
  late Map<String, List> _errors;

  Validation({
    required super.response,
    required super.requestOptions,
  }) {
    _errors = Map<String, List>.from(
      response!.data['errors'] ?? response!.data['error'] ?? {},
    );
  }

  List<String> get keys => _errors.keys.toList();

  List<String>? errorsByKey(String key) => _errors[key]?.cast<String>();

  String? errorByKey(String key) => errorsByKey(key)?.first;

  bool keyHasError(String key) => keys.contains(key);

  @override
  String toString() => 'Validation';
}
