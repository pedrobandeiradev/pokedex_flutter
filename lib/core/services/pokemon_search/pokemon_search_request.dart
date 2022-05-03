import 'package:pokedex/core/services/base/base_request.dart';

class PokemonSearchRequest extends BaseRequest {
  final String terms;

  PokemonSearchRequest({
    required this.terms,
  });

  @override
  String get endpoint => '/pokemon/$terms';
}
