import 'package:pokedex/core/services/base/base_response.dart';

import '../../models/pokemon_details/pokemon_model.dart';

class PokemonDetailsResponse extends GenericBaseResponse {
  final PokemonModel pokemonDetails;

  PokemonDetailsResponse({required this.pokemonDetails});

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsResponse(
      pokemonDetails: json.objectOfThis<PokemonModel>(),
    );
  }
}
