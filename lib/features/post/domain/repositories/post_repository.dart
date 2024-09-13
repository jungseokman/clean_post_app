import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract interface class PostRepository {
  Future<Either<String, List<Post>>> getPostRepo();
}
