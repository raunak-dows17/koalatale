import 'package:flutter/material.dart';

class TabletLoggedInUser extends StatefulWidget {
  const TabletLoggedInUser({super.key});

  @override
  State<TabletLoggedInUser> createState() => _TabletLoggedInUserState();
}

class _TabletLoggedInUserState extends State<TabletLoggedInUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tablet Logged In User'),
      ),
    );
  }
}
