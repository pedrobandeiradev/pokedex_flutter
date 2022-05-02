import 'package:pokedex/core/services/base/base.response.dart';

import '../../models/pokemon_details/pokemon.model.dart';

class PokemonDetailsResponse extends GenericBaseResponse {
  final PokemonModel pokemonDetails;

  PokemonDetailsResponse({required this.pokemonDetails});

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsResponse(
      pokemonDetails: json.objectOfThis<PokemonModel>(),
    );
  }
}
