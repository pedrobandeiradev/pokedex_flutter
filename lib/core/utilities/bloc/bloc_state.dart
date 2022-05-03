import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlocState extends Equatable {}

@immutable
abstract class GenericPageContent extends Equatable {}

class LoadingPageContentState<T extends GenericPageContent> extends BlocState {
  final T content;

  LoadingPageContentState({required this.content});

  @override
  List<Object?> get props => <Object>[content];
}

class SuccessfullyLoadedContentState<T> extends BlocState {
  final T content;

  SuccessfullyLoadedContentState({required this.content});

  @override
  List<Object?> get props => <Object>[content as Object];
}

class FailedLoadingContentState<T extends GenericPageContent>
    extends BlocState {
  @override
  List<Object?> get props => <Object>[];
}
