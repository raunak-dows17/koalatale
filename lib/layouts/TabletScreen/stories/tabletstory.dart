import 'package:flutter/material.dart';
import '../../../shared/widgets/Navbar/navbar.dart';
import '../../../shared/widgets/SideBar/sidebar.dart';

class TabletStoryInfo extends StatelessWidget {
  final Map? storyInfo;

  const TabletStoryInfo({super.key, this.storyInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
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
