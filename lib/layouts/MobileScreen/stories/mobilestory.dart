import 'package:flutter/material.dart';
import '../../../shared/widgets/Navbar/mobilenavbar.dart';
import '../../../shared/widgets/SideBar/sidebar.dart';

class MobileStoryInfo extends StatelessWidget {
  final Map? storyInfo;

  const MobileStoryInfo({super.key, this.storyInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNavbar(),
      drawer: SideNavbar(),
      body: FutureBuilder(
          future: Future.value(storyInfo),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Dialog(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Icon(Icons.error),
                    const SizedBox(width: 20),
                    Text(snapshot.error.toString())
                  ],
                ),
              );
            } else {
              return const LinearProgressIndicator();
            }
          }),
    );
  }
}
