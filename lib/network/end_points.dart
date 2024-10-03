class EndPoints {
  EndPoints._();

  static String get domain => 'https://api.open-meteo.com/v1';

  static Uri weather = Uri.parse(
      '/forecast/?latitude=52.52&longitude=13.41&hourly=temperature_2m');
}
