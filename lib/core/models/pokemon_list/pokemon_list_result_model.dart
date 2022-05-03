import '../base/base_model.dart';
import '../pokemon_details/pokemon_model.dart';

class PokemonListResultModel extends BaseModel {
  final int count;
  final List<PokemonModel> results;

  PokemonListResultModel({
    required this.count,
    required this.results,
  });

  factory PokemonListResultModel.fromJson(Map<String, dynamic> json) {
    return PokemonListResultModel(
      count: json.intOf('count'),
      results: json.listOf(
        'results',
      ),
    );
  }

  @override
  List<Object?> get props => [
        count,
        results,
      ];
}
