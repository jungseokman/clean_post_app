import 'package:clean_app/features/post/presentation/bloc/single_class_bloc/post_bloc.dart';
import 'package:clean_app/features/post/presentation/bloc/sub_class_bloc/read_post_bloc.dart';
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
    context.read<ReadPostBloc>().add(AllReadPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? 단일 클래스
            Expanded(
              child: BlocConsumer<PostBloc, PostState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.postStatus) {
                    //>> 포스트 가져오는중
                    case GetPostStatus.loading:
                      return const Center(child: CircularProgressIndicator());

                    //>> 포스트 성공
                    case GetPostStatus.success:
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(state.posts[index].title),
                              Text(state.posts[index].content),
                            ],
                          );
                        },
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
            ),

            const Divider(
              height: 50,
              color: Colors.red,
            ),

            //? 하위 클래스
            Expanded(
                child: BlocConsumer<ReadPostBloc, ReadPostState>(
              listener: (context, state) {},
              builder: (context, state) {
                switch (state) {
                  case ReadPostLoading():
                    return const Center(child: CircularProgressIndicator());

                  case ReadPostFailure():
                    return Center(
                      child: Text(state.errorMessage),
                    );

                  case ReadPostSuccess():
                    return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(state.posts[index].userid.toString()),
                          Text(state.posts[index].title),
                        ],
                      ),
                    );

                  default:
                    return const SizedBox();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
