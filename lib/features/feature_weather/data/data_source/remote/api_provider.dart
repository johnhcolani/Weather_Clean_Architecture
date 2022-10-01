 import 'package:dio/dio.dart';
import 'package:weather_clean_app/core/utils/constants.dart';
class ApiProvider{
  final Dio _dio =Dio();
  var apiKey=Constants.apiKey1;

  // current weather api call
  Future<dynamic> callCurrentWeather(cityName)async{
    var response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/weather',
      queryParameters: {
        'q':cityName,
        'appid':apiKey,
        'units':'metric'
      }
    );
    print(response.data );
    return response;
  }


}