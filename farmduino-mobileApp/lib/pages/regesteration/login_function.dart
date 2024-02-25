import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/constants/variables.dart';
import 'package:farmduino/helpers/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void login(
    {required Map? response,
    required BuildContext context,
    required String? email,
    required String? password}) async {
  if (response != null) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = response['body']['user']['first_name'];
    String lastName = response['body']['user']['last_name'];

    Variables.email = response['body']['user']['email'];

    await prefs.setString('email', email!);
    await prefs.setString('password', password!);
    await prefs.setString('name', '$firstName $lastName');
    await prefs.setString('token', response['body']['token']);
    LoadingScreen().hide();
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushNamedAndRemoveUntil(
    dashboardRoute,
    (route) => false,
  );
}
