import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:farmduino/wdigets/generic_chart/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        displaySettingsIcon: true,
      ),
      body: const GenericLineChart(
        chartText: 'Temperature',
        plantSpecies: 'Banana',
        idealVariable: '10-20 °C',
        explanation:
            'Bananas need temperature  in between  10-20 °C for optimal growth',
        spots: [
          FlSpot(0, 10),
          FlSpot(5, 35),
          FlSpot(10, 35),
          FlSpot(15, 30),
          FlSpot(20, 20),
          FlSpot(24, 40),
        ],
        minY: 10,
        maxY: 50,
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
      drawer: const CustomDrawer(),
    );
  }
}
