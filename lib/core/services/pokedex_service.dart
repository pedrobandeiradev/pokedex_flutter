import 'package:dio/dio.dart';
import 'package:pokedex/core/services/base/base_service.dart';
import 'package:pokedex/core/services/pokemon_details/pokemon_details_request.dart';
import 'package:pokedex/core/services/pokemon_list/pokemon_list_request.dart';
import 'package:pokedex/core/services/pokemon_search/pokemon_search_request.dart';
import 'package:pokedex/core/services/response_export.dart';

abstract class PokedexServiceProtocol {
  Future<PokemonListResponse> getListOfPokemon(int limit, int offSet);
  Future<PokemonDetailsResponse> getPokemonDetails(String name);
  Future<PokemonSearchResponse> getSearchResults(String terms);
}

class PokedexService with BaseService implements PokedexServiceProtocol {
  final Dio provider;

  PokedexService({
    required this.provider,
  });

  @override
  Future<PokemonListResponse> getListOfPokemon(int limit, int offSet) async {
    final PokemonListRequest request = PokemonListRequest(
      limit: limit,
      offSet: offSet,
    );
    return await execute<PokemonListResponse>(
      request: request,
      provider: provider,
    );
  }

  @override
  Future<PokemonDetailsResponse> getPokemonDetails(String name) async {
    final PokemonDetailsRequest request = PokemonDetailsRequest(
      name: name,
    );
    return await execute<PokemonDetailsResponse>(
      request: request,
      provider: provider,
    );
  }

  @override
  Future<PokemonSearchResponse> getSearchResults(String terms) async {
    final PokemonSearchRequest request = PokemonSearchRequest(
      terms: terms,
    );
    return await execute<PokemonSearchResponse>(
      request: request,
      provider: provider,
    );
  }
}
