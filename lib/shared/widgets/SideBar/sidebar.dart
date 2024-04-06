import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/utils/Apis/user.dart';
import 'package:koalatale/utils/randomcolor.dart';
import '../../../router/routenames.dart';
import '../../colors.dart';
import '../../../utils/Tokens/tokens.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  String token = "";

  @override
  void initState() {
    TokenDetails().getToken().then(
          (value) => setState(() {
            value != null ? token = value : token = "";
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
      child: FutureBuilder(
          future: User().getUserData(token),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  UserAccountsDrawerHeader(
                    arrowColor: Colors.transparent,
                    onDetailsPressed: () =>
                        context.goNamed(RouteNames.authenticatedprofilePage),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor,
                        AppColors.tertiaryColor,
                      ]),
                      image: DecorationImage(
                        image: NetworkImage(
                          snapshot.data!["profileImage"] ??
                              "https://dummyimage.com/600x400/${generateRandomHexColor()}/fff.png&text=${snapshot.data!["name"].toString()[0]}",
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                    ),
                    accountName: Text(snapshot.data!["name"]),
                    accountEmail: Text(snapshot.data!["username"]),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data!["profileImage"] ??
                            "https://dummyimage.com/600x400/${generateRandomHexColor()}/fff.png&text=${snapshot.data!["name"].toString()[0]}",
                      ),
                      radius: 20,
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onTap: () {
                      context.goNamed(RouteNames.homepage);
                    },
                    leading: Icon(
                      CupertinoIcons.book_fill,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "My Stories",
                      style: TextStyle(color: AppColors.primaryTextColor),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onTap: () {
                      context.goNamed(RouteNames.homepage);
                    },
                    leading: Icon(
                      CupertinoIcons.archivebox,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "My Contributions",
                      style: TextStyle(color: AppColors.primaryTextColor),
                    ),
                  ),
                  Divider(
                    color: AppColors.primaryColor,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onTap: () {
                      context.goNamed(RouteNames.authenticatedprofilePage);
                    },
                    leading: Icon(
                      CupertinoIcons.gear,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: AppColors.primaryTextColor),
                    ),
                  ),
                  const Spacer(),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onTap: () {
                      TokenDetails().removeToken().then(
                            (value) => context.go("/"),
                          );
                    },
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return ListView(
                children: [
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
              );
            } else {
              return Container(
                alignment: Alignment.topCenter,
                height: 10,
                child: LinearProgressIndicator(),
              );
            }
          }),
    );
  }
}
