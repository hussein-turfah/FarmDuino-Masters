import 'dart:developer';

import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/services/auth/auth_services.dart';
import 'package:farmduino/wdigets/container/container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Authentication auth = Authentication();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DateTime dob = DateTime.now();
  TextEditingController favoriteColor = TextEditingController();
  TextEditingController plantName = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob,
      firstDate: DateTime(1900),
      lastDate: DateTime(2024, 12, 31),
    );
    if (picked != null && picked != dob) {
      setState(() {
        dob = picked;
      });
    }
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
                CustomContainer(
                  width: double.infinity,
                  backgroundColor: const Color.fromARGB(255, 243, 242, 242),
                  withShadow: true,
                  body: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  signInRoute, (route) => false);
                            },
                            child: Container(
                              width: (size.width / 2) - 20,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7)),
                                color: CustomColors.mainPurpule,
                                border: Border(
                                  right: BorderSide(
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
                                child: Text('Sign In'),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: (size.width / 2) - 20,
                              height: 50,
                              color: const Color.fromARGB(255, 243, 242, 242),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: (size.width / 2) - 40,
                                  child: TextField(
                                    controller: fName,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      labelText: 'First Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (size.width / 2) - 40,
                                  child: TextField(
                                    controller: lName,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      labelText: 'Last Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
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
                              height: 7,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await selectDate(context);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey), // Border color
                                  borderRadius:
                                      BorderRadius.circular(7), // Border radius
                                ),
                                child: Text(
                                  '${dob.year}/${dob.month}/${dob.day}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextField(
                              controller: favoriteColor,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                labelText: 'Favorite Color',
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextField(
                              controller: plantName,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                labelText: 'Plant Name',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: GestureDetector(
                                onTap: () async {
                                  String formattedDob =
                                      DateFormat('yy-MM-dd').format(dob);
                                  if (fName.text.isNotEmpty &&
                                      lName.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      password.text.isNotEmpty &&
                                      dob != DateTime.now() &&
                                      favoriteColor.text.isNotEmpty &&
                                      plantName.text.isNotEmpty) {
                                    await auth.register(
                                      fName: fName.text,
                                      lName: lName.text,
                                      email: email.text,
                                      password: password.text,
                                      dateOfBirth: formattedDob,
                                      favoriteColor: favoriteColor.text,
                                      plantName: plantName.text,
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  color: CustomColors.mainPurpule,
                                  child: const Center(
                                    child: Text(
                                      'Sign up',
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
                                    text: "By hitting sign up you agree on our",
                                  ),
                                  TextSpan(
                                    text: ' Terms and Conditions!.',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 14, 119, 204),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        log('Terms and conditions');
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
