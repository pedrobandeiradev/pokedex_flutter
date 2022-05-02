import 'pokemon_sprite_image/pokemon_sprite.model.dart';
import 'pokemon_type.model.dart';

class PokemonModel {
  final int id;
  final String name;
  final double height;
  final double weight;
  final List<PokemonType> types;
  final List<PokemonSprite> sprites;

  PokemonModel(
    this.id,
    this.name,
    this.height,
    this.weight,
    this.types,
    this.sprites,
  );
}
