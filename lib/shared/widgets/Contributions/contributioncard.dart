import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koalatale/shared/colors.dart';
import 'package:koalatale/shared/datetime.dart';
import 'package:koalatale/utils/Apis/user.dart';
import 'package:koalatale/utils/Apis/vote.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';

// ignore: must_be_immutable
class ContributionCard extends StatefulWidget {
  String id;
  String content;
  String name;
  String profileImage;
  String username;
  String createdAt;
  int voteCount;
  List votes;

  ContributionCard({
    super.key,
    required this.id,
    required this.content,
    required this.name,
    required this.profileImage,
    required this.username,
    required this.createdAt,
    required this.voteCount,
    required this.votes,
  });

  @override
  State<ContributionCard> createState() => _ContributionCardState();
}

class _ContributionCardState extends State<ContributionCard> {
  bool isLiked = false;
  String? errorMessage;

  void handleLike() {
    TokenDetails().getToken().then((value) {
      if (value != null) {
        VoteAConrtibution().handleVotes(widget.id, value).then(
              (value) => setState(() {
                isLiked = !isLiked;
                widget.voteCount = value["voteCount"];
              }),
            );
      } else {
        setState(() {
          errorMessage = "You need to login to vote a contribution";
        });
        // throw Exception("No token");
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => Exception(error));
  }

  @override
  void initState() {
    TokenDetails().getToken().then((value) => {
          if (value != null)
            {
              User().getUserData(value).then((value) {
                if (widget.votes.any(
                    (element) => element["username"] == value["username"])) {
                  setState(() {
                    isLiked = true;
                  });
                } else {
                  setState(() {
                    isLiked = false;
                  });
                }
              })
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {},
      onDoubleTap: () => handleLike(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.tertiaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.content,
              style: TextStyle(
                color: AppColors.tertiaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImage),
                  radius: 10,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.username,
                  style: TextStyle(color: AppColors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => handleLike(),
                      icon: Icon(
                        isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: isLiked ? Colors.redAccent : Colors.black,
                      ),
                    ),
                    // const SizedBox(width: 4),
                    Text(widget.voteCount.toString())
                  ],
                ),
                Text(
                  "${TimeAgo().getTimeAgo(widget.createdAt)} ago",
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            if (errorMessage != null) const SizedBox(height: 10),
            if (errorMessage != null)
              Text(
                errorMessage ?? "",
                style: const TextStyle(color: Colors.red),
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}
