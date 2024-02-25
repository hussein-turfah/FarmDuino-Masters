import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/constants/themes/dark_theme.dart';
import 'package:farmduino/pages/Dashboard/dashboard.dart';
import 'package:farmduino/pages/humidity/humidity_page.dart';
import 'package:farmduino/pages/light%20intensity/light_intensity_page.dart';
import 'package:farmduino/pages/regesteration/sign_in_page.dart';
import 'package:farmduino/pages/regesteration/sign_up_page.dart';
import 'package:farmduino/pages/soil%20moisture/soil_moisture_page.dart';
import 'package:farmduino/pages/temperature/temperature_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Farmduino',
      debugShowCheckedModeBanner: false,
      //darkTheme: darkTheme,
      theme: ThemeData(
        fontFamily: 'DM_Sans',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 141, 66, 239)),
        useMaterial3: true,
      ),
      home: const SignInPage(),
      routes: {
        signInRoute: (context) => const SignInPage(),
        signUpRoute: (context) => const SignUpPage(),
        dashboardRoute: (context) => const Dashboard(),
        temperatureRoute: (context) => const TemperaturePage(),
        humidityRoute: (context) => const HumedityPage(),
        soilMoistureRoute: (context) => const SoilMoisturePage(),
        lightIntensityRoute: (context) => const LightIntensityPage(),
      },
    ),
  );
}
