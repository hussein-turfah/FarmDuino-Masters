import 'dart:developer';
import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/pages/Dashboard/Acutator%20Settings/on_off_cards.dart';
import 'package:farmduino/services/logic/logic.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:farmduino/pages/Dashboard/Acutator%20Settings/actuator_settings.dart';
import 'package:farmduino/pages/Dashboard/details/plant_details.dart';
import 'package:farmduino/pages/Dashboard/weather/wather_widget.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Logic logic = Logic();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'General Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'Greenhouse 1',
                        ),
                      ),
                    ],
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (value) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: logic.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List;
                      return SizedBox(
                        height: 170,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 170,
                                  child: cards(
                                      title: data[index]['name'],
                                      details: data[index]['value']),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return const Text('no data');
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Actuator Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnOffCards(
                        title: 'Fans',
                      ),
                      OnOffCards(
                        title: 'Lights',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ActuatorSettings(
                    size: size,
                    title: 'Range of temperature',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ActuatorSettings(
                    size: size,
                    title: 'Range of light',
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'Weather Forecast',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoSlab'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        WeatherWidget(
                          date: 'Wednesday 21 Feb',
                          temp: '16°C',
                          humidity: '50%',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        WeatherWidget(
                          date: 'Wednesday 22 Feb',
                          temp: '18°C',
                          humidity: '35%',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        WeatherWidget(
                          date: 'Wednesday 23 Feb',
                          temp: '19°C',
                          humidity: '55%',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Plantdetails(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              log('Add new item is pressed');
            },
            backgroundColor: CustomColors.lighterMainPurple,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: CustomColors.pageBackgroundColor,
    );
  }
}

Widget cards({required String title, required int details}) {
  Icon icon;
  String unit = '';
  if (title == "temperature") {
    icon = const Icon(
      Icons.thermostat,
      size: 35,
    );
    unit = '°C';
  } else if (title == "humidity") {
    icon = const Icon(
      Icons.water_drop_outlined,
      size: 35,
    );
    unit = '%';
  } else if (title == "soil_moisture") {
    icon = const Icon(
      Icons.water,
      size: 35,
    );
    unit = '%';
  } else if (title == "light_intensity") {
    icon = const Icon(
      Icons.lightbulb_outline,
      size: 35,
    );
    unit = 'lx';
  } else {
    icon = const Icon(
      Icons.forest,
      size: 35,
    );
  }
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: CustomColors.detailsColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            icon,
            Text(
              '$details $unit',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
