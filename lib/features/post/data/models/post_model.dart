import 'package:clean_app/features/post/domain/entities/post.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'PostModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  @override
  List<Object> get props => [userId, id, title, body];

  Post toEintity() {
    return Post(
      userid: userId,
      id: id,
      title: title,
      content: body,
    );
  }
}
