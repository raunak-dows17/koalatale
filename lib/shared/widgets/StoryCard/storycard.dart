import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/routenames.dart';
import '../../colors.dart';

// ignore: must_be_immutable
class StoryCard extends StatelessWidget {
  final Map storyInfo;

  const StoryCard({
    super.key,
    required this.storyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(RouteNames.storyPage,
            pathParameters: {'id': storyInfo["_id"].toString()});
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  storyInfo["title"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Image.asset(
                  "assets/images/storyBook.png",
                  fit: BoxFit.cover,
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(storyInfo["content"][0]["text"]),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("~by"),
                const SizedBox(
                  width: 6,
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(storyInfo["author"]["profileImage"]),
                  radius: 8,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(storyInfo["author"]["name"]),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Contributions"),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(storyInfo["contributions"].length.toString()),
                  ],
                ),
                storyInfo["contributions"].length > 0
                    ? Row(
                        children: [
                          for (int i = 0;
                              i < storyInfo["contributions"].length;
                              i++)
                            Align(
                              widthFactor: 0.5,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(storyInfo[
                                            "contributions"][i]["author"]
                                        ["profileImage"] ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/1200px-Default_pfp.svg.png"),
                              ),
                            ),
                          storyInfo["contributions"].length > 5
                              ? CircleAvatar(
                                  radius: 16,
                                  backgroundColor: AppColors.backgroundColor,
                                  child: Text(
                                      (storyInfo["contributions"].length - 5)
                                          .toString()),
                                )
                              : const SizedBox(width: 0)
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
