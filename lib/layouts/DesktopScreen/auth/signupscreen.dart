import 'package:flutter/material.dart';
import 'package:image_input/image_input.dart';
import 'package:koalatale/shared/colors.dart';

class DesktopSignUpScreen extends StatefulWidget {
  const DesktopSignUpScreen({super.key});

  @override
  State<DesktopSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<DesktopSignUpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "assets/images/signupImage.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(12),
              height: double.infinity,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectableText(
                          "Welcome To Koalatale!!!",
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SelectableText(
                          "We need a little bit of your information to get you started!",
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ProfileAvatar(
                          radius: 69,
                          allowEdit: true,
                          backgroundColor: AppColors.secondaryColor,
                          addImageIcon: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add_a_photo),
                            ),
                          ),
                          removeImageIcon: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.close),
                            ),
                          ),
                          onImageChanged: (XFile? image) {
                            String? tempPath = image?.path;
                            print(tempPath);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
