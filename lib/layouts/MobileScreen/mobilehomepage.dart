import 'package:flutter/material.dart';
import 'package:koalatale/shared/widgets/Navbar/navbar.dart';
import 'package:koalatale/utils/Apis/stories.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/SideBar/sidebar.dart';
import '../../shared/widgets/StoryCard/storycard.dart';

class MobileHomeScreen extends StatefulWidget {
  final List stories;

  const MobileHomeScreen({super.key, required this.stories});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  String token = "";
  final ScrollController _scrollController = ScrollController();
  final bool _showImageAndText = true;

  @override
  void initState() {
    TokenDetails().getToken().then((value) => setState(() {
          value != null ? token = value : token = "";
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SideNavbar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 0,
            collapsedHeight: 1,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // double imageHeight = constraints.biggest.height;
                return FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.cover,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _showImageAndText ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          // color: AppColors.backgroundColor,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Inspires the stories, Inspired by stories",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: MediaQuery.of(context).size.width < 435
                  ? MediaQuery.of(context).size.width < 340
                      ? 1.2
                      : 1.5
                  : 0.8,
            ),

            // physics: const BouncingScrollPhysics(),
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FutureBuilder(
                  future: Stories().getStories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: StoryCard(storyInfo: widget.stories[index]),
                      );
                    } else if (snapshot.hasError) {
                      return Dialog(
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Error: ${snapshot.error}"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: LinearProgressIndicator(
                          color: AppColors.secondaryColor,
                          backgroundColor: AppColors.tertiaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }
                  },
                );
              },
              childCount: widget.stories.length,
            ),
          ),
        ],
      ),
    );
  }
}
