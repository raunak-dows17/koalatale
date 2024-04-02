import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routenames.dart';
import '../../colors.dart';
import '../../../utils/Tokens/tokens.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  bool hasToken = false;

  @override
  void initState() {
    TokenDetails().hasToken().then(
          (value) => setState(() {
            hasToken = value;
          }),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width > 1024
          ? MediaQuery.of(context).size.width / 4
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        children: hasToken
            ? []
            : [
                DrawerHeader(
                  duration: Durations.long4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor,
                        AppColors.tertiaryColor,
                      ],
                      transform: const GradientRotation(1),
                    ),
                  ),
                  child: const Icon(Icons.book),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    context.goNamed(RouteNames.homepage);
                  },
                  leading: Icon(
                    Icons.home_filled,
                    color: AppColors.primaryColor,
                  ),
                  title: Text(
                    "HomePage",
                    style: TextStyle(color: AppColors.primaryTextColor),
                  ),
                ),
              ],
      ),
    );
  }
}
