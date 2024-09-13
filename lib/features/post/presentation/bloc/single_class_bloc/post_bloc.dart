import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:clean_app/features/post/domain/usecases/post_usecase/get_post_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'post_event.dart';
part 'post_state.dart';

@singleton
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostUsecase getPostUsecase;

  PostBloc(
    this.getPostUsecase,
  ) : super(PostState.initial()) {
    on<GetPostEvent>((event, emit) async {
      emit(state.copyWith(postStatus: GetPostStatus.loading));

      final result = await getPostUsecase.execute();

      result.fold(
        (err) => emit(
          state.copyWith(errorMsg: err, postStatus: GetPostStatus.error),
        ),
        (posts) => emit(state.copyWith(
          postStatus: GetPostStatus.success,
          posts: posts,
        )),
      );
    });
  }
}
