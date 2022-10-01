import 'package:dio/dio.dart';
import 'package:weather_clean_app/core/resources/data_state.dart';
import 'package:weather_clean_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_clean_app/features/feature_weather/data/model/current_city_model.dart';
import 'package:weather_clean_app/features/feature_weather/domain/entities/current_city_entity.dart';
import '../../domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed("Something went wrong. try again . . .");
      }
    } catch (e) {
      return const DataFailed("Please check your connection . . .");
    }
  }
}
