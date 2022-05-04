import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/app_routes.dart';
import 'package:pokedex/features/home/ui/components/home_error.dart';
import 'package:pokedex/features/home/ui/pages/splash_text.dart';

import '../../../../core/utilities/bloc/bloc_export.dart';
import '../../bloc/home_bloc.dart';
import '../components/full_page_loader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _fetchData();
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _didFinishLoadingData() {
    Navigator.of(context).pushNamed(
      RouteName.home,
    );
  }

  void _fetchData() {
    _bloc.add(
      RetrieveListOfPokemonEvent(
        limit: 50,
        offSet: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buider(),
    );
  }

  BlocBuilder _buider() {
    return BlocBuilder<HomeBloc, BlocState>(
      bloc: _bloc,
      builder: (BuildContext context, BlocState state) {
        if (state is SuccessfullyLoadedContentState) {
          _didFinishLoadingData();
        } else if (state is FailedLoadingContentState) {
          return const HomeError(
            error: SplashText.errorMessage,
          );
        }
        return FullPageLoader(
          controller: _controller,
        );
      },
    );
  }
}
