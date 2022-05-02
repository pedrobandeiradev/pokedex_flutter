import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app/app_routes.dart';

import '../../../../core/services/pokemon_list/pokemon_list.response.dart';
import '../../../../core/utilities/bloc/bloc.export.dart';
import '../../bloc/home_bloc.export.dart';

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
    _startRotatingPokeball();
    _fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startRotatingPokeball() {
    _controller.forward();
    _controller.repeat();
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
      body: _buider,
    );
  }

  Widget get _loader {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: _splashImage,
          ),
        ],
      ),
    );
  }

  Widget get _buider {
    return BlocBuilder<HomeBloc, BlocState>(
      bloc: _bloc,
      builder: (BuildContext context, BlocState state) {
        if (state is SuccessfullyLoadedContentState<PokemonListResponse>) {
          _didFinishLoadingData();
        } else if (state is FailedLoadingContentState) {
          return _errorContent;
        }
        return _loader;
      },
    );
  }

  Widget get _errorContent {
    return Container(
      color: Colors.black,
      child: Column(
        children: const [
          Text(
            'Error',
          ),
        ],
      ),
    );
  }

  Widget get _splashImage {
    return const Image(
      image: AssetImage(
        'assets/pokeball.png',
      ),
    );
  }
}
