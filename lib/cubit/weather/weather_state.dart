part of 'weather_cubit.dart';

@Freezed(
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions(when: false),
  copyWith: false,
)
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.success() = _Success;
  const factory WeatherState.failure() = _Failure;
}
