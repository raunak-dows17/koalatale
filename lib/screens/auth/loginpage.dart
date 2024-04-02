import 'package:flutter/material.dart';
import '../../Responsive/responsive.dart';
import '../../layouts/DesktopScreen/auth/LoginScreen.dart';
import '../../layouts/MobileScreen/auth/LoginScreen.dart';
import '../../layouts/TabletScreen/auth/loginscreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: const MobileLoginScreen(),
      tabletScreen: const TabletLoginScreen(),
      desktopScreen: const DesktopLoginScreen(),
    );
  }
}
