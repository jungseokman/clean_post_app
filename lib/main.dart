import 'package:clean_app/core/router.dart';
import 'package:clean_app/di/di_setup.dart';
import 'package:clean_app/features/post/presentation/bloc/single_class_bloc/post_bloc.dart';
import 'package:clean_app/features/post/presentation/bloc/sub_class_bloc/read_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();

  runApp(const PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PostBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ReadPostBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: routers,
      ),
    );
  }
}
