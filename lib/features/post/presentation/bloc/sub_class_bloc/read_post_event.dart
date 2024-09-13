part of 'read_post_bloc.dart';

sealed class ReadPostEvent extends Equatable {
  const ReadPostEvent();

  @override
  List<Object> get props => [];
}

class AllReadPostEvent extends ReadPostEvent {}
