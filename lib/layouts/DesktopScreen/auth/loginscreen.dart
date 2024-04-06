import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/router/routenames.dart';
import 'package:koalatale/shared/colors.dart';
import 'package:koalatale/utils/Apis/auth.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({super.key});

  @override
  State<DesktopLoginScreen> createState() => _DesktopLoginScreenState();
}

class _DesktopLoginScreenState extends State<DesktopLoginScreen> {
  final formKey = GlobalKey<FormState>();
  Map<String, String> formData = {
    "username": "",
    "password": "",
  };
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.all(24),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/loginImage.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      SelectableText(
                        "Welcome Back To Koalatale !!!",
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          letterSpacing: 3,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SelectableText(
                        "Koala is happy to see you again",
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Username";
                            } else if (value.contains(" ")) {
                              return "Username cannot contain spaces";
                            } else {
                              setState(() {
                                formData["username"] = value;
                              });
                              return null;
                            }
                          },
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Username",
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            } else {
                              setState(() {
                                formData["password"] = value;
                              });
                              return null;
                            }
                          },
                          autocorrect: true,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                !isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primaryColor,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Auth().login(formData).then((value) {
                                  TokenDetails()
                                      .setToken(value)
                                      .then((v) => context.go("/"));
                                }).catchError((err) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: SelectableText(err.toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              }
                            },
                            style: const ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size.infinite)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account on koalatale "),
                      InkWell(
                        onTap: () => context.goNamed(RouteNames.signuppage),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: AppColors.primaryTextColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
