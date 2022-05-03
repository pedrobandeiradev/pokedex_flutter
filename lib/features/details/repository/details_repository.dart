import 'package:pokedex/core/services/pokedex_service.dart';
import 'package:pokedex/core/services/response_export.dart';

abstract class DetailsRepositoryProtocol {
  Future<PokemonDetailsResponse> fetchPokemonDetails({
    required String name,
  });
}

class DetailsRepository implements DetailsRepositoryProtocol {
  final PokedexService service;

  DetailsRepository({
    required this.service,
  });

  @override
  Future<PokemonDetailsResponse> fetchPokemonDetails({
    required String name,
  }) async {
    return await service.getPokemonDetails(name);
  }
}
