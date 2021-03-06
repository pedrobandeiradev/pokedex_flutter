import 'package:flutter/material.dart';
import 'package:pokedex/app/app_routes.dart';

import 'pokemon_card_text.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageURL = PokemonCardText.imageURL;

  const PokemonCard({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RouteName.details,
        arguments: {
          'name': name,
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade300,
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 24.0,
                  ),
                  child: _pokemonName(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: _pokemonID(),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: _pokemonImage(),
            ),
          ],
        ),
      ),
    );
  }

  Text _pokemonName() {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _pokemonID() {
    return Text(
      '#$id',
    );
  }

  Image _pokemonImage() {
    return Image(
      image: NetworkImage(
        imageURL + '$id.png',
      ),
    );
  }
}
