import 'package:flutter/foundation.dart';
import 'package:weather_clean_app/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class FwStatus{}

class FwLoading extends FwStatus{}

class FwCompleted extends FwStatus{
  final CurrentCityEntity currentCityEntity;
  FwCompleted(this.currentCityEntity);
}

class FwError extends FwStatus{
  final String message;

  FwError(this.message);
}