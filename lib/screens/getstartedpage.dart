import 'package:flutter/material.dart';
import 'package:koalatale/Responsive/responsive.dart';
import 'package:koalatale/layouts/DesktopScreen/getstarted.dart';
import 'package:koalatale/layouts/MobileScreen/getstarted.dart';
import 'package:koalatale/layouts/TabletScreen/getstarted.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: MobileGetStarted(),
      tabletScreen: TabletGetStarted(),
      desktopScreen: DesktopGetStarted(),
    );
  }
}
