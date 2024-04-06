import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/router/routenames.dart';
import 'package:koalatale/shared/colors.dart';

class MobileGetStarted extends StatelessWidget {
  const MobileGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Column(
                    children: [
                      Text(
                        "Welcome to KoalaTale",
                        style: TextStyle(
                          fontSize: 40,
                          color: AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      // Tagline
                      Text(
                        "UNFOLD STORIES, CREATE CONNECTIONS",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryTextColor,
                          letterSpacing: 4,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  ),
                  // Subheading
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "KoalaTale is a collaborative storytelling platform. Write, Contribute and vote conributions of the fellow writer's contributions!",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryTextColor,
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.signuppage);
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                    ),
                    child: Text(
                      "Start writing Now!",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.tertiaryColor,
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Image.asset(
          //     "images/gs1.jpg",
          //     width: double.infinity,
          //     height: double.infinity,
          //     fit: BoxFit.fill,
          //   ),
          // )
        ],
      ),
    );
  }
}
