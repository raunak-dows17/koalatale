import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSize {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      titleSpacing: 25,
      title: Image.asset(
        "assets/logo/text-logo.png",
        width: 200,
        height: 45,
        fit: BoxFit.fill,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
