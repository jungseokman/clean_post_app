import 'package:clean_app/features/post/presentation/pages/post/post_page.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
  initialLocation: "/post",
  routes: [
    GoRoute(
      path: "/post",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: PostPage()),
    )
  ],
);
