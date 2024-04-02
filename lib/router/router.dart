import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routenames.dart';
import '../screens/auth/loginpage.dart';
import '../screens/homepage.dart';
import '../screens/story/storydetailscreen.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: RouteNames.homepage,
      pageBuilder: ((context, state) {
        return const MaterialPage(child: HomePage());
      }),
    ),
    GoRoute(
      path: "/auth/login",
      name: RouteNames.loginpage,
      pageBuilder: ((context, state) {
        return const MaterialPage(child: LoginPage());
      }),
    ),
    GoRoute(
      name: RouteNames.storyPage,
      path: "/story/:id",
      pageBuilder: ((context, state) {
        return MaterialPage(
            child: StoryDetails(id: state.pathParameters['id']));
      }),
    ),
  ]);
}
