import 'package:flutter/material.dart';
import 'package:koalatale/shared/colors.dart';

// ignore: must_be_immutable
class ContributionCard extends StatelessWidget {
  String id;
  String content;
  String name;
  String profileImage;
  String username;

  ContributionCard(
      {super.key,
      required this.id,
      required this.content,
      required this.name,
      required this.profileImage,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: TextStyle(color: Colors.blue[500]),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
                radius: 10,
              ),
              const SizedBox(width: 10),
              Text("$name ($username)"),
            ],
          )
        ],
      ),
    );
  }
}
