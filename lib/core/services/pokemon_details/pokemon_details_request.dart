import 'package:pokedex/core/services/base/base_request.dart';

class PokemonDetailsRequest extends BaseRequest {
  final String name;

  PokemonDetailsRequest({
    required this.name,
  });

  @override
  String get endpoint => '/pokemon/$name';
}
