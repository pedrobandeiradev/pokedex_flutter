import 'package:pokedex/core/utilities/bloc/bloc_event.dart';

abstract class DetailsEvents extends BlocEvent {}

class FetchPokemonDetailsEvent extends DetailsEvents {
  final String name;

  FetchPokemonDetailsEvent({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
