import 'package:flutter/material.dart';
import '../Responsive/responsive.dart';
import '../layouts/DesktopScreen/desktophomepage.dart';
import '../layouts/MobileScreen/mobileHomePage.dart';
import '../layouts/TabletScreen/tablethomepage.dart';
import '../utils/Apis/Stories.dart';
import '../utils/Tokens/tokens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TokenDetails tokenDetails = TokenDetails();
  List storiesList = [];

  String? token;
  @override
  void initState() {
    tokenDetails.getToken().then(
          (value) => setState(() {
            token = value;
          }),
        );

    Stories()
        .getStories()
        .then(
          (value) => setState(() {
            storiesList = value["stories"];
          }),
        )
        .catchError(
          (err) => debugPrint(err.toString()),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: MobileHomeScreen(stories: storiesList),
      tabletScreen: TabletHomeScreen(
        stories: storiesList,
      ),
      desktopScreen: DesktopHomePage(
        stories: storiesList,
      ),
    );
  }
}
