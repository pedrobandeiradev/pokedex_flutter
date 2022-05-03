import 'package:pokedex/core/models/base/base_model.dart';

import 'pokemon_sprite_other_model.dart';

class PokemonSprite extends BaseModel {
  final List<PokemonSpriteOtherModel> otherSprites;

  PokemonSprite({
    required this.otherSprites,
  });

  factory PokemonSprite.fromJson(Map<String, dynamic> json) {
    return PokemonSprite(
      otherSprites: json.listOf(
        'other',
      ),
    );
  }

  @override
  List<Object?> get props => [
        otherSprites,
      ];
}
