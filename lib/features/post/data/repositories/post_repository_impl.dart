import 'package:clean_app/features/post/data/datasources/post_datasooure.dart';
import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:clean_app/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostDatasooure postDatasooure;
  PostRepositoryImpl({
    required this.postDatasooure,
  });

  @override
  Future<Either<String, List<Post>>> getPostRepo() async {
    final result = await postDatasooure.getPost();

    return result.fold(
        (err) => Left(err),
        (posts) => Right(
              posts
                  .map(
                    (e) => e.toEintity(),
                  )
                  .toList(),
            ));
  }
}
