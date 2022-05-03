import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/details/bloc/details_bloc.dart';
import 'package:pokedex/features/details/ui/components/type_card.dart';
import 'package:pokedex/features/details/ui/pages/details_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsBloc get _bloc => BlocProvider.of<DetailsBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _builder(),
    );
  }

  AppBar get _appBar {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.red,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  _builder() {
    return _content;
  }

  _content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _pokemonImageContainer(),
          _pokemonInfoContainer(),
        ],
      ),
    );
  }

  _pokemonImageContainer() {
    String pokemonID = _bloc.pokemon.id;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Image.network(
        DetailsText.imageURL + '$pokemonID.png',
      ),
    );
  }

  _pokemonInfoContainer() {
    return Column(
      children: [
        _pokemonName(),
        _listOfTypes(),
        _listOfInformations(),
      ],
    );
  }

  _pokemonName() {
    return Text(
      _bloc.pokemon.name,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _listOfInformations() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Stats name'),
          subtitle: Text('Stats description $index'),
        );
      },
    );
  }

  _listOfTypes() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 32 / 12,
      children: List.generate(
        2,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: TypeCard(
              typeName: _bloc.pokemon.types[index],
              baseColor: _bloc.pokemon.baseColor!,
            ),
          );
        },
      ),
    );
  }
}
