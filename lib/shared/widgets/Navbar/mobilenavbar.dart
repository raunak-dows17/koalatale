import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/router/routenames.dart';

class MobileNavbar extends StatelessWidget implements PreferredSize {
  const MobileNavbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      elevation: 12,
      titleSpacing: -12,
      title: Image.asset(
        "assets/logo/text-logo.png",
        width: 160,
        height: 35,
        fit: BoxFit.fill,
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.goNamed(RouteNames.loginpage);
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            )),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
