import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Responsive extends StatelessWidget {
  Widget mobileScreen;
  Widget tabletScreen;
  Widget desktopScreen;

  Responsive(
      {super.key,
      required this.mobileScreen,
      required this.tabletScreen,
      required this.desktopScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth.clamp(480, 1024) == constraint.maxWidth) {
          return tabletScreen;
        } else if (constraint.maxWidth < 480) {
          return mobileScreen;
        } else {
          return desktopScreen;
        }
      },
    );
  }
}
