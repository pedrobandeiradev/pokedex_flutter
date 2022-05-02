import '../../models/pokemon_details/pokemon.model.dart';
import '../base/base.response.dart';

class PokemonSearchResponse extends GenericBaseResponse {
  final PokemonModel? pokemonDetails;

  PokemonSearchResponse({required this.pokemonDetails});

  factory PokemonSearchResponse.fromJson(Map<String, dynamic> json) {
    return PokemonSearchResponse(
      pokemonDetails: json.objectOfThis<PokemonModel>(),
    );
  }
}
