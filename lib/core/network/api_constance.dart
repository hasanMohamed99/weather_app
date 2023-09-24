class ApiConstance {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _apiKey = 'c0754e54a9de754a16b650544c782b86';

  static String weatherDayPath({required double lat, required double lon}) =>
      '/weather?lat=$lat&lon=$lon&appid=$_apiKey';
  static String weatherWeekPath({required double lat, required double lon}) =>
      '/forecast?lat=$lat&lon=$lon&appid=$_apiKey';
  static String weatherDayCityPath({required String cityName}) =>
      '/weather?q=$cityName&appid=$_apiKey';
}
