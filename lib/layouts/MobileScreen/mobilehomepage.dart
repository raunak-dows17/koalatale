import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/Navbar/mobilenavbar.dart';
import '../../shared/widgets/SideBar/sidebar.dart';
import '../../shared/widgets/StoryCard/storycard.dart';

class MobileHomeScreen extends StatelessWidget {
  final List stories;

  MobileHomeScreen({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNavbar(),
      drawer: SideNavbar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Raunak!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Inspires the stroies, Inspired by stories",
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
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
              ),
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:
                      (MediaQuery.of(context).size.width * 11) / 12,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: MediaQuery.of(context).size.width < 435
                      ? MediaQuery.of(context).size.width < 340
                          ? 1.2
                          : 1.5
                      : 0.8,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                children: stories
                    .map(
                      (e) => FutureBuilder(
                          future: Future.value(stories),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return StoryCard(storyInfo: e);
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
                              return const LinearProgressIndicator();
                            }
                          }),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
