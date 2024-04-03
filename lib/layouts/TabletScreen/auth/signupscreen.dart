import 'package:flutter/material.dart';

class TabletSignUpScreen extends StatefulWidget {
  const TabletSignUpScreen({super.key});

  @override
  State<TabletSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<TabletSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tablet signup screen"),
      ),
    );
  }
}
