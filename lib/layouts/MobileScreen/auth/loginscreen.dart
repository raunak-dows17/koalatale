import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koalatale/router/routenames.dart';
import 'package:koalatale/shared/colors.dart';
import 'package:koalatale/utils/Apis/auth.dart';
import 'package:koalatale/utils/Tokens/tokens.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
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
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
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
                    height: 20,
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
                                .then((value) => context.pop());
                          }).catchError((err) => null);
                        }
                      },
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size.infinite)),
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
            const SizedBox(
              height: 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                const Text("Don't have an account on koalatale? "),
                InkWell(
                  onTap: () => context.goNamed(RouteNames.signuppage),
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: AppColors.primaryTextColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
