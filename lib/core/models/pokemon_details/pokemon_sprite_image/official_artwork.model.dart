import 'package:pokedex/core/models/base/base.model.dart';

class OfficialArtworkModel extends BaseModel {
  final String frontDefault;

  OfficialArtworkModel({
    required this.frontDefault,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json.stringOf(
        'front_default',
      ),
    );
  }

  @override
  List<Object?> get props => [
        frontDefault,
      ];
}
