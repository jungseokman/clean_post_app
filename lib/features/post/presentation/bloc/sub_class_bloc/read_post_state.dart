part of 'read_post_bloc.dart';

sealed class ReadPostState extends Equatable {
  const ReadPostState();

  @override
  List<Object> get props => [];
}

final class ReadPostInitial extends ReadPostState {}

final class ReadPostLoading extends ReadPostState {}

final class ReadPostSuccess extends ReadPostState {
  final List<Post> posts;

  const ReadPostSuccess({required this.posts});

  @override
  List<Object> get props => [posts];
}

final class ReadPostFailure extends ReadPostState {
  final String errorMessage;

  const ReadPostFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
