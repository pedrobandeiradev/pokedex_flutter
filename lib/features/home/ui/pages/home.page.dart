import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/utilities/bloc/bloc.export.dart';
import 'package:pokedex/features/home/bloc/home_bloc.export.dart';
import 'package:pokedex/features/home/ui/components/pokemon_card.ui.dart';
import 'package:pokedex/features/home/ui/components/search_bar.ui.dart';

import '../../../../core/services/response.export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: _appBar(),
        body: _buider(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: const Image(
        image: AssetImage(
          'assets/pokeball.png',
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  _loader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buider() {
    return BlocBuilder<HomeBloc, BlocState>(
      bloc: _bloc,
      builder: (BuildContext context, BlocState state) {
        if (state is SuccessfullyLoadedContentState<PokemonListResponse>) {
          return _content();
        } else if (state is FailedLoadingContentState) {
          return _errorContent();
        }
        return _loader();
      },
    );
  }

  _content() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
            ),
            child: SearchBar(),
          ),
          _listOfPokemon(),
        ],
      ),
    );
  }

  _errorContent() {
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

  _listOfPokemon() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: List.generate(_bloc.listOfPokemon.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: PokemonCard(
            name: _bloc.listOfPokemon[index].name,
            id: _bloc.listOfPokemon[index].id,
          ),
        );
      }),
    );
  }
}
