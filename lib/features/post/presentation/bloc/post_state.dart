part of 'post_bloc.dart';

enum GetPostStatus {
  initial,
  loading,
  success,
  error,
}

class PostState extends Equatable {
  final List<Post> posts;
  final String errorMsg;
  final GetPostStatus postStatus;
  const PostState({
    required this.posts,
    required this.errorMsg,
    required this.postStatus,
  });

  @override
  List<Object> get props => [posts, errorMsg, postStatus];

  factory PostState.initial() {
    return const PostState(
      posts: [],
      errorMsg: "",
      postStatus: GetPostStatus.initial,
    );
  }

  PostState copyWith({
    List<Post>? posts,
    String? errorMsg,
    GetPostStatus? postStatus,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      errorMsg: errorMsg ?? this.errorMsg,
      postStatus: postStatus ?? this.postStatus,
    );
  }

  @override
  String toString() =>
      'PostState(posts: $posts, errorMsg: $errorMsg, postStatus: $postStatus)';
}
