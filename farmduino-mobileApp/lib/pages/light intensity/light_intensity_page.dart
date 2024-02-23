import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:farmduino/wdigets/appbar/appbar.dart';
import 'package:farmduino/wdigets/generic_chart/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LightIntensityPage extends StatelessWidget {
  const LightIntensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: GenericLineChart(
        chartText: 'Light intensity',
        plantSpecies: 'Banana',
        idealVariable: '30,000-100,000 lux.',
        explanation:
            ' The ideal light intensity for growing bananas effectively falls within the range of about 30,000 to 100,000 lux. .',
        spots: [
          FlSpot(0, 30000),
          FlSpot(5, 20000),
          FlSpot(10, 60000),
          FlSpot(15, 80000),
          FlSpot(20, 80000),
          FlSpot(24, 80000),
        ],
        minY: 0,
        maxY: 100000,
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
      drawer: CustomDrawer(),
    );
  }
}
