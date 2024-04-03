import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/screens/auth/signuppage.dart';
import 'routenames.dart';
import '../screens/auth/loginpage.dart';
import '../screens/homepage.dart';
import '../screens/story/storydetailscreen.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: "/", routes: [
    GoRoute(
        path: "/",
        name: RouteNames.homepage,
        pageBuilder: ((context, state) {
          return const MaterialPage(child: HomePage());
        }),
        routes: [
          GoRoute(
            path: "auth/login",
            name: RouteNames.loginpage,
            pageBuilder: ((context, state) {
              return const MaterialPage(child: LoginPage());
            }),
          ),
          GoRoute(
            path: "auth/signup",
            name: RouteNames.signuppage,
            pageBuilder: ((context, state) {
              return const MaterialPage(child: SignUpPage());
            }),
          ),
          GoRoute(
            name: RouteNames.storyPage,
            path: "story/:id",
            pageBuilder: ((context, state) {
              return MaterialPage(
                  child: StoryDetails(id: state.pathParameters['id']));
            }),
          ),
        ]),
  ]);
}
