import 'package:flutter/material.dart';

class DesktopLoggedInUser extends StatefulWidget {
  const DesktopLoggedInUser({super.key});

  @override
  State<DesktopLoggedInUser> createState() => _DesktopLoggedInUserState();
}

class _DesktopLoggedInUserState extends State<DesktopLoggedInUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Desktop Logged In User'),
      ),
    );
  }
}
