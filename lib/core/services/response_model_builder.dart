import 'package:pokedex/core/services/response_export.dart';
import 'package:pokedex/core/utilities/builder/object_builder_factory.dart';

mixin BuilderPokedexFactory {
  static ObjectBuilderFactory buildObjects =
      (Map<String, dynamic> json) => <Type, ObjectBuilder>{
            PokemonListResponse: () => PokemonListResponse.fromJson(json),
            PokemonDetailsResponse: () => PokemonDetailsResponse.fromJson(json),
            PokemonSearchResponse: () => PokemonSearchResponse.fromJson(json),
          };
}
