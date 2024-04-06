import 'package:flutter/material.dart';

class MobileLoggedInUser extends StatefulWidget {
  const MobileLoggedInUser({super.key});

  @override
  State<MobileLoggedInUser> createState() => _MobileLoggedInUserState();
}

class _MobileLoggedInUserState extends State<MobileLoggedInUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mobile Logged In User'),
      ),
    );
  }
}
