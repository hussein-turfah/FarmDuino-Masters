import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:farmduino/wdigets/generic_chart/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SoilMoisturePage extends StatelessWidget {
  const SoilMoisturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const GenericLineChart(
        chartText: 'Soil moisture',
        plantSpecies: 'Banana',
        idealVariable: '40-80 %',
        explanation:
            ' The ideal soil moisture content for banana cultivation typically ranges between 40% and 80%.',
        spots: [
          FlSpot(0, 50),
          FlSpot(5, 20),
          FlSpot(10, 60),
          FlSpot(15, 60),
          FlSpot(20, 80),
          FlSpot(24, 70),
        ],
        minY: 0,
        maxY: 100,
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
      drawer: const CustomDrawer(),
    );
  }
}
