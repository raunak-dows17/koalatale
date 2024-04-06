import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koalatale/utils/Apis/user.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/Navbar/navbar.dart';
import '../../shared/widgets/SideBar/sidebar.dart';
import '../../shared/widgets/StoryCard/storycard.dart';
import '../../utils/Apis/stories.dart';

class DesktopHomePage extends StatefulWidget {
  final List stories;

  DesktopHomePage({super.key, required this.stories});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
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
      appBar: const Navbar(),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SideNavbar(),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: false,
                  toolbarHeight: 0,
                  collapsedHeight: 1,
                  expandedHeight: MediaQuery.of(context).size.height / 2,
                  flexibleSpace: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double imageHeight = constraints.biggest.height;
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
                                margin: const EdgeInsets.only(bottom: 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                        future: User().getUserData(token),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              "Hello! ${snapshot.data!['username']}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: imageHeight * 0.1,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                              "Hello!",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: imageHeight * 0.1,
                                              ),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),
                                    SizedBox(height: imageHeight * 0.03),
                                    Text(
                                      "Inspires the stories, Inspired by stories",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: imageHeight * 0.075,
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.8,
                  ),
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
                              child:
                                  StoryCard(storyInfo: widget.stories[index]),
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
          ),
        ],
      ),
    );
  }
}
