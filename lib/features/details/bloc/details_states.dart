import '../../../core/utilities/bloc/bloc_export.dart';

abstract class DetailsState extends BlocState {}

class InitialState extends DetailsState {
  @override
  List<Object?> get props => <Object>[];
}
