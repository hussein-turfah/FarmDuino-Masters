import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/pages/Dashboard/dashboard.dart';
import 'package:farmduino/pages/humidity/humidity_page.dart';
import 'package:farmduino/pages/light%20intensity/light_intensity_page.dart';
import 'package:farmduino/pages/regesteration/login_function.dart';
import 'package:farmduino/pages/regesteration/sign_in_page.dart';
import 'package:farmduino/pages/regesteration/sign_up_page.dart';
import 'package:farmduino/pages/settings/settings.dart';
import 'package:farmduino/pages/soil%20moisture/soil_moisture_page.dart';
import 'package:farmduino/pages/temperature/temperature_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Farmduino',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM_Sans',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 141, 66, 239)),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: getStoredCredentials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                login(
                  response: null,
                  context: context,
                  email: null,
                  password: null,
                );
              });
              return Container(); // Consider returning a SplashScreen or similar widget here
            } else {
              return const SignInPage();
            }
          } else {
            // Handle loading state, perhaps show a progress indicator
            return const CircularProgressIndicator();
          }
        },
      ),
      routes: {
        signInRoute: (context) => const SignInPage(),
        signUpRoute: (context) => const SignUpPage(),
        dashboardRoute: (context) => const Dashboard(),
        temperatureRoute: (context) => const TemperaturePage(),
        humidityRoute: (context) => const HumidityPage(),
        soilMoistureRoute: (context) => const SoilMoisturePage(),
        lightIntensityRoute: (context) => const LightIntensityPage(),
        settingsPage: (context) => const Settings(),
      },
    ),
  );
}

Future<Map> getStoredCredentials() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email');
  final password = prefs.getString('password');
  if (email == null) {
    return {};
  } else {
    return {
      "email": email,
      "password": password,
    };
  }
}
