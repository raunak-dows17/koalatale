import 'package:flutter/material.dart';
import 'package:koalatale/Responsive/responsive.dart';
import 'package:koalatale/layouts/DesktopScreen/auth/signupscreen.dart';
import 'package:koalatale/layouts/MobileScreen/auth/signupscreen.dart';
import 'package:koalatale/layouts/TabletScreen/auth/signupscreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: MobileSignUpScreen(),
      tabletScreen: TabletSignUpScreen(),
      desktopScreen: DesktopSignUpScreen(),
    );
  }
}
