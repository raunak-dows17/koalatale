import 'package:flutter/material.dart';

class MobileSignUpScreen extends StatefulWidget {
  const MobileSignUpScreen({super.key});

  @override
  State<MobileSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<MobileSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mobile signup screen"),
      ),
    );
  }
}
