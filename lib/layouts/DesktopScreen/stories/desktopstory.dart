import 'package:flutter/material.dart';
import 'package:koalatale/shared/colors.dart';
import 'package:koalatale/shared/widgets/Contributions/contributioncard.dart';
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(content?["text"]),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: storyInfo!["author"]
                                                  ["username"] ==
                                              content["author"]["username"]
                                          ? []
                                          : [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  content["author"]
                                                      ["profileImage"],
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                content["author"]["name"],
                                                style: const TextStyle(),
                                              )
                                            ],
                                    )
                                  ],
                                );
                              },
                            ),

                            const SizedBox(height: 24),
                            // Contributions
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Contributions",
                                  style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                                    return ContributionCard(
                                      id: contributions["_id"],
                                      content: contributions["content"],
                                      name: contributions["author"]["name"],
                                      profileImage: contributions["author"]
                                          ["profileImage"],
                                      username: contributions["author"]
                                          ["username"],
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
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column()))
        ],
      ),
    );
  }
}
