import 'package:pokedex/core/utilities/bloc/bloc_event.dart';

abstract class HomeEvents extends BlocEvent {}

class RetrieveListOfPokemonEvent extends HomeEvents {
  final int limit;
  final int offSet;

  RetrieveListOfPokemonEvent({
    required this.limit,
    required this.offSet,
  });
  @override
  List<Object?> get props => [
        limit,
        offSet,
      ];
}

class SearchPokemonEvent extends HomeEvents {
  final String searchTerm;

  SearchPokemonEvent({
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [];
}
