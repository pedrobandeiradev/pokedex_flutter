import 'package:pokedex/core/utilities/bloc/bloc.export.dart';

abstract class HomeState extends BlocState {}

class InitialState extends HomeState {
  @override
  List<Object?> get props => <Object>[];
}

class SearchResultsEmptyState extends HomeState {
  @override
  List<Object?> get props => [];
}
