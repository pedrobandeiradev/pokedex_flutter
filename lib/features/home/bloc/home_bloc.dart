import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/services/pokemon_list/pokemon_list_response.dart';
import 'package:pokedex/core/services/pokemon_search/pokemon_search_response.dart';
import 'package:pokedex/features/home/models/pokemon_entry_model.dart';

import '../../../core/utilities/bloc/bloc_export.dart';
import '../repository/home_repository.dart';
import 'home_events.dart';
import 'home_states.dart';

export 'home_bloc.dart';
export 'home_events.dart';
export 'home_states.dart';

class HomeBloc extends Bloc<BlocEvent, BlocState> {
  final HomeRepository repository;
  late int _limit;
  int _currentOffset = 0;

  HomeBloc({
    required this.repository,
  }) : super(InitialState());

  List<PokemonEntryModel> listOfPokemon = [];

  List<PokemonEntryModel> filteredSearchList = [];

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is RetrieveListOfPokemonEvent) {
      yield* _fetchListOfPokemon(
        limit: event.limit,
        offSet: event.offSet,
      );
    }
    if (event is SearchPokemonEvent) {
      yield* _searchPokemonBy(
        term: event.searchTerm,
      );
    }
  }

  Stream<BlocState> _fetchListOfPokemon({
    required int limit,
    required int offSet,
  }) async* {
    _limit = limit;
    _currentOffset = _currentOffset + _limit;
    try {
      final PokemonListResponse response = await repository.fetchListOfPokemon(
        limit: limit,
        offSet: offSet,
      );
      yield SuccessfullyLoadedContentState<PokemonListResponse>(
        content: response,
      );
    } catch (exception) {
      yield FailedLoadingContentState();
    }
  }

  Stream<BlocState> _searchPokemonBy({
    required String term,
  }) async* {
    try {
      final PokemonSearchResponse response = await repository.searchForPokemon(
        searchTerms: term,
      );
      if (response.pokemonDetails == null) {
        yield SearchResultsEmptyState();
      } else {
        filteredSearchList.add(
          PokemonEntryModel(
            name: response.pokemonDetails?.name ?? '',
            id: response.pokemonDetails?.id.toString() ?? '',
          ),
        );
        yield SuccessfullyLoadedContentState<PokemonSearchResponse>(
          content: response,
        );
      }
    } catch (exception) {
      yield FailedLoadingContentState();
    }
  }
}
