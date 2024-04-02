import 'package:flutter/material.dart';
import '../../Responsive/responsive.dart';
import '../../layouts/DesktopScreen/stories/desktopstory.dart';
import '../../layouts/MobileScreen/stories/mobilestory.dart';
import '../../layouts/TabletScreen/stories/tabletstory.dart';
import '../../utils/Apis/stories.dart';

// ignore: must_be_immutable
class StoryDetails extends StatefulWidget {
  String? id;
  StoryDetails({super.key, this.id});

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  Map? storyDetails;

  @override
  void initState() {
    Stories()
        .getStoriesById(widget.id)
        .then(
          (value) => setState(() {
            storyDetails = value;
          }),
        )
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileScreen: MobileStoryInfo(
        storyInfo: storyDetails,
      ),
      tabletScreen: TabletStoryInfo(
        storyInfo: storyDetails,
      ),
      desktopScreen: DesktopStoryInfo(
        storyInfo: storyDetails,
      ),
    );
  }
}
