import 'package:pokedex/core/models/pokemon_list/pokemon_list_result.model.dart';
import 'package:pokedex/core/services/base/base.response.dart';

class PokemonListResponse extends GenericBaseResponse {
  final PokemonListResultModel listOfPokemon;

  PokemonListResponse({
    required this.listOfPokemon,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      listOfPokemon: json.objectOfThis<PokemonListResultModel>(),
    );
  }
}
