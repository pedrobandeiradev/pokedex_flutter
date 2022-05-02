import 'package:pokedex/core/models/base/base.model.dart';

class PokemonType extends BaseModel {
  final String name;

  PokemonType({required this.name});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json.stringOf(
        'name',
      ),
    );
  }

  @override
  List<Object?> get props => [
        name,
      ];
}
