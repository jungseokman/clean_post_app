import 'package:clean_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(GetPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<PostBloc, PostState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.postStatus) {
                //>> 포스트 가져오는중
                case GetPostStatus.loading:
                  return const Center(child: CircularProgressIndicator());

                //>> 포스트 성공
                case GetPostStatus.success:
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(state.posts[index].title),
                            Text(state.posts[index].content),
                          ],
                        );
                      },
                    ),
                  );

                //>> 포스트 에러
                case GetPostStatus.error:
                  return Text(state.errorMsg);

                //>> 포스트 처음
                default:
                  return const SizedBox();
              }
            },
          ),
        ],
      )),
    );
  }
}
