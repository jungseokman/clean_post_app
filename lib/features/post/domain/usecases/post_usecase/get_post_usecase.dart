import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:clean_app/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetPostUsecase {
  final PostRepository postRepository;

  GetPostUsecase({required this.postRepository});

  Future<Either<String, List<Post>>> execute() async {
    return await postRepository.getPostRepo();
  }
}
