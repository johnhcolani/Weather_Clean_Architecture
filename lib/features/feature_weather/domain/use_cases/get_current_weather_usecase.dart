
import 'package:weather_clean_app/core/resources/data_state.dart';
import 'package:weather_clean_app/core/usecase/use_case.dart';
import 'package:weather_clean_app/features/feature_weather/domain/entities/current_city_entity.dart';

import '../repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>,String>{
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {
  return weatherRepository.fetchCurrentWeatherData(param);
  }



}