import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/screens/auth/signuppage.dart';
import 'package:koalatale/screens/getstartedpage.dart';
import 'package:koalatale/screens/user/loggedInUserPage.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';
import 'routenames.dart';
import '../screens/auth/loginpage.dart';
import '../screens/homepage.dart';
import '../screens/story/storydetailscreen.dart';

class AppRouter {
  GoRouter router = GoRouter(
      initialLocation: "/",
      redirect: (context, state) async {
        bool hastoken = await TokenDetails().hasToken();
        if (hastoken && state.path == "/") {
          return null;
        } else {
          if (state.matchedLocation == "/auth/login" ||
              state.matchedLocation == "/auth/signup") {
            return null;
          } else {
            return "/auth/signup";
          }
        }
      },
      routes: [
        GoRoute(
            path: "/",
            name: RouteNames.homepage,
            pageBuilder: ((context, state) {
              return const MaterialPage(child: HomePage());
            }),
            routes: [
              GoRoute(
                path: "getstarted",
                name: RouteNames.getstarted,
                pageBuilder: ((context, state) {
                  return const MaterialPage(child: GetStartedPage());
                }),
              ),
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
                path: "auth/user",
                name: RouteNames.authenticatedprofilePage,
                pageBuilder: ((context, state) {
                  return const MaterialPage(child: LoggedInUserPage());
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
