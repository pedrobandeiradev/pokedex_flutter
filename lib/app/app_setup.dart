import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/services/pokedex.service.dart';
import 'package:pokedex/features/details/bloc/details_bloc.export.dart';
import 'package:pokedex/features/home/bloc/home_bloc.export.dart';
import 'package:pokedex/app/app_routes.dart';

import '../features/details/repository/details.repository.dart';
import '../features/home/repository/home.repository.dart';
import '../features/home/ui/pages/splash.page.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            repository: HomeRepository(
              service: PokedexService(
                provider: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider<DetailsBloc>(
          create: (BuildContext context) => DetailsBloc(
            repository: DetailsRepository(
              service: PokedexService(
                provider: Dio(),
              ),
            ),
          ),
        ),
      ],
      child: const AppSetup(),
    );
  }
}

class AppSetup extends StatelessWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashPage(),
      routes: AppRoutes.builder,
      debugShowCheckedModeBanner: false,
    );
  }
}
