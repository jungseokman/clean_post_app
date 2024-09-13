import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:clean_app/features/post/domain/usecases/post_usecase/get_post_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'read_post_event.dart';
part 'read_post_state.dart';

@singleton
class ReadPostBloc extends Bloc<ReadPostEvent, ReadPostState> {
  final GetPostUsecase getPostUsecase;
  ReadPostBloc(this.getPostUsecase) : super(ReadPostInitial()) {
    on<AllReadPostEvent>((event, emit) async {
      emit(ReadPostLoading());

      final result = await getPostUsecase.execute();

      result.fold(
        (err) => emit(ReadPostFailure(errorMessage: err)),
        (posts) => emit(ReadPostSuccess(posts: posts)),
      );
    });
  }
}
