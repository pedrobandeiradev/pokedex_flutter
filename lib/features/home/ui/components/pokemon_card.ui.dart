import 'package:flutter/material.dart';
import 'package:pokedex/app/app_routes.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String id;
  final String imageURL =
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/';

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
                  child: _pokemonName,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: _pokemonID,
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
              child: _pokemonImage,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _pokemonName {
    return SizedBox(
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget get _pokemonID {
    return SizedBox(
      child: Text(
        '#$id',
      ),
    );
  }

  Widget get _pokemonImage {
    return SizedBox(
      child: Image(
        image: NetworkImage(
          imageURL + '$id.png',
        ),
      ),
    );
  }
}
