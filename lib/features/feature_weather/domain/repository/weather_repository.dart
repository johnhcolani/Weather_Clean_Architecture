
import '../../../../core/resources/data_state.dart';
import '../entities/current_city_entity.dart';

abstract class WeatherRepository{
  Future<DataState<CurrentCityEntity>>fetchCurrentWeatherData(String cityName);
}