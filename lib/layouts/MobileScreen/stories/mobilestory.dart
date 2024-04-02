import 'package:flutter/material.dart';
import 'package:koalatale/shared/colors.dart';
import 'package:koalatale/shared/widgets/Contributions/contributioncard.dart';
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
      body: SingleChildScrollView(
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
                        itemCount:
                            (snapshot.data!["content"] as List?)?.length ?? 0,
                        itemBuilder: (context, index) {
                          final content = snapshot.data!["content"]?[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(content?["text"]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: storyInfo!["author"]["username"] ==
                                        content["author"]["username"]
                                    ? []
                                    : [
                                        const Text(
                                          "~ contributed by",
                                          style: TextStyle(),
                                        ),
                                        const SizedBox(width: 8),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            content["author"]["profileImage"],
                                          ),
                                          radius: 8,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          content["author"]["username"],
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
                            physics: const ScrollPhysics(),
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
                                username: contributions["author"]["username"],
                                createdAt: contributions["createdAt"],
                                voteCount: contributions["voteCount"],
                                votes: contributions["votes"],
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
    );
  }
}
