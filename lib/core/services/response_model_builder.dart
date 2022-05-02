import 'package:pokedex/core/services/response.export.dart';
import 'package:pokedex/core/utilities/builder/object_builder_factory.dart';

mixin BuilderPokedexFactory {
  static ObjectBuilderFactory buildObjects =
      (Map<String, dynamic> json) => <Type, ObjectBuilder>{
            PokemonListResponse: () => PokemonListResponse.fromJson(json),
          };
}
