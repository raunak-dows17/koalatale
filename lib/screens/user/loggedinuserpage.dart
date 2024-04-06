import 'package:flutter/material.dart';
import 'package:koalatale/Responsive/responsive.dart';
import 'package:koalatale/layouts/DesktopScreen/user/loggedinuser.dart';
import 'package:koalatale/layouts/MobileScreen/user/loggedinuser.dart';
import 'package:koalatale/layouts/TabletScreen/user/loggedinuser.dart';

class LoggedInUserPage extends StatefulWidget {
  const LoggedInUserPage({super.key});

  @override
  State<LoggedInUserPage> createState() => _LoggedInUserPageState();
}

class _LoggedInUserPageState extends State<LoggedInUserPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: MobileLoggedInUser(),
      tabletScreen: TabletLoggedInUser(),
      desktopScreen: DesktopLoggedInUser(),
    );
  }
}
