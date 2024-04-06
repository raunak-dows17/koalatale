import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/router/routenames.dart';
import 'package:koalatale/utils/Apis/user.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';
import 'package:koalatale/utils/randomcolor.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  String token = "";

  @override
  void initState() {
    TokenDetails().getToken().then(
          (value) => setState(() {
            value == null ? token = "" : token = value;
          }),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      titleSpacing: MediaQuery.of(context).size.width < 480 ? 0 : 25,
      title: Image.asset(
        "assets/logo/text-logo.png",
        width: 200,
        height: 45,
        fit: BoxFit.fill,
      ),
      actions: [
        FutureBuilder(
          future: User().getUserData(token),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return InkWell(
                onTap: () {
                  context.goNamed(RouteNames.authenticatedprofilePage);
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    snapshot.data!["profileImage"] ??
                        "https://dummyimage.com/600x400/${generateRandomHexColor()}/fff.png&text=${snapshot.data!["name"].toString()[0]}",
                  ),
                  radius: 20,
                ),
              );
            } else if (snapshot.hasError) {
              return ElevatedButton(
                onPressed: () {
                  context.goNamed(RouteNames.loginpage);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width < 480 ? 4 : 25),
      ],
    );
  }
}
