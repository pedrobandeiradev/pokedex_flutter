import 'package:pokedex/core/services/response_model_builder.dart';
import 'package:pokedex/core/utilities/builder/object_builder_factory.dart';

mixin MixinModelFactory {
  static ObjectBuilderFactory buildObjects = (Map<String, dynamic> json) =>
      <Type, ObjectBuilder>{}..addAll(BuilderPokedexFactory.buildObjects(json));
}
