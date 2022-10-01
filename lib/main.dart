import 'package:flutter/material.dart';
import 'core/widgets/main_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/feature_weather/presentation/bloc/home_bloc.dart';
import 'locator.dart';

void main() async {
  /// init
  await setup();

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>locator<HomeBloc>()),
        ],
    child: MainWrapper()),
  ));
}
