
import 'package:get_it/get_it.dart';
import 'package:weather_clean_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_clean_app/features/feature_weather/data/repository/weather_repositoryImpl.dart';
import 'package:weather_clean_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:weather_clean_app/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_clean_app/features/feature_weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;
setup(){
  locator.registerSingleton<ApiProvider>(ApiProvider());
  ///repository
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  ///usecase
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));

  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));





}