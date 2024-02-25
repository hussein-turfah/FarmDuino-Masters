import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:farmduino/wdigets/generic_chart/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        displaySettingsIcon: true,
      ),
      drawer: const CustomDrawer(),
      body: const GenericLineChart(
        chartText: 'Humidity',
        plantSpecies: 'Banana',
        idealVariable: '90-95%',
        explanation:
            'The optimal humidity level for storing bananas is around 90-95%.',
        spots: [
          FlSpot(0, 30),
          FlSpot(5, 70),
          FlSpot(10, 80),
          FlSpot(15, 90),
          FlSpot(20, 80),
          FlSpot(24, 70),
        ],
        minY: 0,
        maxY: 100,
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
    );
  }
}
