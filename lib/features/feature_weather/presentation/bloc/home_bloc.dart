import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_clean_app/core/resources/data_state.dart';
import 'package:weather_clean_app/features/feature_weather/presentation/bloc/cw_status.dart';

import '../../domain/use_cases/get_current_weather_usecase.dart';
import 'fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  HomeBloc(this.getCurrentWeatherUseCase)
      : super(HomeState(cwStatus: CwLoading(),fwStatus: FwLoading())) {
    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));
      emit(state.copyWith(newFwStatus: FwLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newCwStatus: CwCompleted(dataState.data)));
        emit(state.copyWith(newFwStatus: FwCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(newCwStatus: CwError(dataState.error!)));
        emit(state.copyWith(newFwStatus: FwError(dataState.error!)));
      }
    });
  }
}
