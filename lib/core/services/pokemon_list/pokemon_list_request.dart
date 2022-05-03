import '../base/base_request.dart';

class PokemonListRequest extends BaseRequest {
  final int limit;
  final int offSet;

  PokemonListRequest({
    required this.limit,
    required this.offSet,
  });

  @override
  String get endpoint => '/pokemon';

  @override
  Map<String, dynamic> get params => {
        'limit': limit,
        'offSet': offSet,
      };
}
