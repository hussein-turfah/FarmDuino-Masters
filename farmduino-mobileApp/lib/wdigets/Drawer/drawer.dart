import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/constants/routs.dart';
import 'package:farmduino/constants/variables.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: CustomColors.mainPurpule,
      child: ListView(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: CustomColors.lighterMainPurple,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        child: Icon(Icons.person),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Variables.isDarkTheme = !Variables.isDarkTheme;
                            Theme.of(context).colorScheme.inversePrimary;
                          });
                        },
                        icon: Icon(
                          (Variables.isDarkTheme)
                              ? Icons.mode_night_outlined
                              : Icons.wb_sunny_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Variables.currentUser,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '▼',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Variables.drawerIndex != 0) {
                setState(() {
                  Variables.drawerIndex = 0;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      dashboardRoute, (route) => false);
                });
              }
            },
            child: Container(
              color: (Variables.drawerIndex == 0)
                  ? CustomColors.darkerMainPurple
                  : CustomColors.mainPurpule,
              height: 60,
              child: const Row(
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Variables.drawerIndex != 1) {
                setState(() {
                  Variables.drawerIndex = 1;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      temperatureRoute, (route) => false);
                });
              }
            },
            child: Container(
              height: 60,
              color: (Variables.drawerIndex == 1)
                  ? CustomColors.darkerMainPurple
                  : CustomColors.mainPurpule,
              child: const Row(
                children: [
                  Icon(
                    Icons.thermostat,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Temperature',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Variables.drawerIndex != 2) {
                setState(() {
                  Variables.drawerIndex = 2;
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(humidityRoute, (route) => false);
                });
              }
            },
            child: Container(
              height: 60,
              color: (Variables.drawerIndex == 2)
                  ? CustomColors.darkerMainPurple
                  : CustomColors.mainPurpule,
              child: const Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Humidity',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Variables.drawerIndex != 3) {
                setState(() {
                  Variables.drawerIndex = 3;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      soilMoistureRoute, (route) => false);
                });
              }
            },
            child: Container(
              height: 60,
              color: (Variables.drawerIndex == 3)
                  ? CustomColors.darkerMainPurple
                  : CustomColors.mainPurpule,
              child: const Row(
                children: [
                  Icon(
                    Icons.water,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Soil Moisture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Variables.drawerIndex != 4) {
                setState(() {
                  Variables.drawerIndex = 4;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      lightIntensityRoute, (route) => false);
                });
              }
            },
            child: Container(
              height: 60,
              color: (Variables.drawerIndex == 4)
                  ? CustomColors.darkerMainPurple
                  : CustomColors.mainPurpule,
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Light intensity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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
