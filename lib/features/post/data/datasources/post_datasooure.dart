import 'package:clean_app/features/post/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class PostDatasooure {
  final Dio _dio = Dio();

  Future<Either<String, List<PostModel>>> getPost() async {
    try {
      final response =
          await _dio.get("https://jsonplaceholder.typicode.com/posts");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data as List)
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();

        return Right(result);
      } else {
        return Left("${response.statusCode} : 포스트 데이터를 가져오는데 실패 했습니다.");
      }
    } catch (e) {
      return Left("$e : 포스트 데이터를 가져오는데 실패 했습니다.");
    }
  }
}
