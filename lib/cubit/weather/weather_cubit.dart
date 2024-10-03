import 'package:flutter_application_1/cubit/base_cubit.dart';
import 'package:flutter_application_1/repositories/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends BaseCubit<WeatherState> {
  final Weather _repository;

  WeatherCubit({required Weather repository})
      : _repository = repository,
        super(const WeatherState.initial());

  void invoke() async {
    try {
      emit(const WeatherState.loading());

      await _repository.invoke();

      emit(WeatherState.success());
    } catch (e) {
      emit(const WeatherState.failure());
    }
  }
}
