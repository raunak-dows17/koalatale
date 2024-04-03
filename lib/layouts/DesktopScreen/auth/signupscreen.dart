import 'package:flutter/material.dart';

class DesktopSignUpScreen extends StatefulWidget {
  const DesktopSignUpScreen({super.key});

  @override
  State<DesktopSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<DesktopSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Desktop signup screen"),
      ),
    );
  }
}
