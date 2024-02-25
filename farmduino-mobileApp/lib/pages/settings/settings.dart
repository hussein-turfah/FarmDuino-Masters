import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        displaySettingsIcon: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('email');
                    await prefs.remove('password');
                    await prefs.remove('name');
                    await prefs.remove('token');
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      signInRoute,
                      (route) => false,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.grey[400],
                      child: const Center(
                        child: Text(
                          'logout',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
    );
  }
}
