import 'package:pokedex/core/services/pokedex_service.dart';
import 'package:pokedex/core/services/response_export.dart';

abstract class HomeRepositoryProtocol {
  Future<PokemonListResponse> fetchListOfPokemon({
    required int limit,
    required int offSet,
  });

  Future<PokemonSearchResponse> searchForPokemon({
    required String searchTerms,
  });
}

class HomeRepository implements HomeRepositoryProtocol {
  final PokedexService service;

  HomeRepository({
    required this.service,
  });

  @override
  Future<PokemonListResponse> fetchListOfPokemon({
    required int limit,
    required int offSet,
  }) async {
    return await service.getListOfPokemon(limit, offSet);
  }

  @override
  Future<PokemonSearchResponse> searchForPokemon({
    required String searchTerms,
  }) async {
    return await service.getSearchResults(searchTerms);
  }
}
