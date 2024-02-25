import 'dart:developer';
import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/helpers/loading/loading_screen.dart';
import 'package:farmduino/pages/regesteration/login_function.dart';
import 'package:farmduino/services/auth/auth_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Authentication auth = Authentication();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: SvgPicture.asset("assets/images/colored_logo.svg"),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(-4, 5),
                          color: const Color.fromARGB(177, 158, 158, 158)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10),
                    ],
                    color: const Color.fromARGB(255, 243, 242, 242),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: (size.width / 2) - 20,
                              height: 50,
                              color: const Color.fromARGB(255, 243, 242, 242),
                              child: const Center(
                                child: Text('Sign In'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  signUpRoute, (route) => false);
                            },
                            child: Container(
                              width: (size.width / 2) - 20,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: CustomColors.mainPurpule,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(7)),
                                border: Border(
                                  left: BorderSide(
                                    color: Color.fromARGB(125, 80, 80, 80),
                                    width: 2,
                                  ),
                                  bottom: BorderSide(
                                    color: Color.fromARGB(125, 80, 80, 80),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            TextField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                labelText: 'Email',
                              ),
                              autocorrect: false,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextField(
                              controller: password,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: GestureDetector(
                                onTap: () async {
                                  if (email.text.isNotEmpty &&
                                      password.text.isNotEmpty) {
                                    LoadingScreen().show(
                                        context: context,
                                        showCircularIndecator: true,
                                        text: 'please wait a minute');
                                    final response = await auth.login(
                                      email: email.text,
                                      password: password.text,
                                    );
                                    log('$response');
                                    if (response["success"] == true) {
                                      // ignore: use_build_context_synchronously
                                      login(
                                        response: response,
                                        context: context,
                                        email: email.text,
                                        password: password.text,
                                      );
                                    } else {
                                      LoadingScreen().hide();
                                      // ignore: use_build_context_synchronously
                                      LoadingScreen().show(
                                          context: context,
                                          showCircularIndecator: false,
                                          text: '${response['body']['error']}');

                                      await Future.delayed(
                                        const Duration(seconds: 2),
                                      );
                                      LoadingScreen().hide();
                                    }
                                  } else {
                                    LoadingScreen().hide();
                                    LoadingScreen().show(
                                        context: context,
                                        showCircularIndecator: false,
                                        text: 'something went wrong');

                                    await Future.delayed(
                                      const Duration(seconds: 4),
                                    );
                                    LoadingScreen().hide();
                                    log('is empty');
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  color: CustomColors.mainPurpule,
                                  child: const Center(
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: "Forgot your password?",
                                  ),
                                  TextSpan(
                                    text: ' Reset password now!',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 14, 119, 204),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        log('Navigation to sign up');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
