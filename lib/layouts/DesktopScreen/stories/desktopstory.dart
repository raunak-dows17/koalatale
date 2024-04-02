import 'package:flutter/material.dart';
import '../../../shared/widgets/Navbar/navbar.dart';
import '../../../shared/widgets/SideBar/sidebar.dart';

class DesktopStoryInfo extends StatelessWidget {
  final Map? storyInfo;

  const DesktopStoryInfo({super.key, this.storyInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideNavbar(),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast,
              ),
              child: FutureBuilder(
                  future: Future.value(storyInfo),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data!["title"],
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),

                            // Content
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: (snapshot.data!["content"] as List?)
                                      ?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final content =
                                    snapshot.data!["content"]?[index];
                                return Column(
                                  children: [
                                    Text(content?["text"]),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [],
                                    )
                                  ],
                                );
                              },
                            ),

                            // Contributions
                            Column(
                              children: [
                                const Text("Contributions"),
                                const SizedBox(height: 16),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      (snapshot.data!["contributions"] as List?)
                                              ?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    final contributions =
                                        snapshot.data!["contributions"]?[index];
                                    return Column(
                                      children: [
                                        Text(contributions?["text"]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      );
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
            ),
          ),
        ],
      ),
    );
  }
}
