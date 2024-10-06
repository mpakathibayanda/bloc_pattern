import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesplay/app_screen.dart';
import 'package:yesplay/apps/counter/cubit/counter_cubit.dart';
import 'package:yesplay/apps/weather/bloc/weather_bloc.dart';
import 'package:yesplay/apps/weather/repository/weather_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
        ],
        child: const MaterialApp(
          title: 'Bloc Pattern',
          debugShowCheckedModeBanner: false,
          home: AppScreen(),
        ),
      ),
    );
  }
}
