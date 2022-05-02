import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/services/response.export.dart';
import 'package:pokedex/features/details/models/pokemon_details.model.dart';
import '../../../core/utilities/bloc/bloc.export.dart';
import '../repository/details.repository.dart';
import 'details_bloc.export.dart';

class DetailsBloc extends Bloc<BlocEvent, BlocState> {
  DetailsBloc({
    required this.repository,
  }) : super(InitialState());

  late PokemonDetailsModel pokemon;

  final DetailsRepository repository;

  @override
  BlocState get initialState => InitialState();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is FetchPokemonDetailsEvent) {
      yield* _fetchPokemonDetails(
        name: event.name,
      );
    }
  }

  Stream<BlocState> _fetchPokemonDetails({
    required String name,
  }) async* {
    try {
      final PokemonDetailsResponse response =
          await repository.fetchPokemonDetails(
        name: name,
      );
      pokemon = PokemonDetailsModel(
        name: response.pokemonDetails.name,
        id: response.pokemonDetails.id.toString(),
        types: response.pokemonDetails.types.map((type) => type.name).toList(),
        height: response.pokemonDetails.height.toString(),
        weight: response.pokemonDetails.weight.toString(),
      );
    } catch (exception) {
      yield FailedLoadingContentState();
    }
  }
}
