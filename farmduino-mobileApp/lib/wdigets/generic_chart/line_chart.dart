import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/container/container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenericLineChart extends StatelessWidget {
  final double minY;
  final double maxY;
  final String chartText;
  final String plantSpecies;
  final String idealVariable;
  final String explanation;
  final List<FlSpot> spots;
  const GenericLineChart(
      {super.key,
      required this.chartText,
      required this.plantSpecies,
      required this.idealVariable,
      required this.explanation,
      required this.spots,
      required this.minY,
      required this.maxY});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 24,
                    minY: minY,
                    maxY: maxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        color: CustomColors.mainPurpule,
                        barWidth: 3,
                        isCurved: false,
                        belowBarData: BarAreaData(
                          show: true,
                          color: CustomColors.mainPurpule.withOpacity(0.5),
                        ),
                      ),
                    ],
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d).withOpacity(0.5),
                          strokeWidth: 0.5,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                          axisNameWidget: Text(
                            'Time (24h)',
                          ),
                          sideTitles: SideTitles(
                            reservedSize: 40,
                            showTitles: true,
                          )),
                      rightTitles: AxisTitles(
                        axisNameWidget: Text(
                          chartText,
                        ),
                        axisNameSize: 22,
                        sideTitles: const SideTitles(
                          reservedSize: 40,
                          showTitles: true,
                        ),
                      ),
                      bottomTitles: const AxisTitles(
                          axisNameWidget: Text(
                            'Time (24h)',
                          ),
                          sideTitles: SideTitles(
                            reservedSize: 40,
                            showTitles: true,
                          )),
                      leftTitles: AxisTitles(
                        axisNameWidget: Text(
                          chartText,
                        ),
                        axisNameSize: 22,
                        sideTitles: const SideTitles(
                          reservedSize: 40,
                          showTitles: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomContainer(
              width: double.infinity,
              backgroundColor: CustomColors.pageBackgroundColor,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: const Image(
                            image: AssetImage(
                              'assets/images/ideal.jpg',
                            ),
                            width: 200,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: CustomContainer(
                            width: null,
                            height: 130,
                            backgroundColor:
                                const Color.fromARGB(99, 210, 210, 210),
                            withShadow: false,
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'Planet Species',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      plantSpecies,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomContainer(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Ideal $chartText',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                idealVariable,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 85,
                      backgroundColor: const Color.fromARGB(99, 210, 210, 210),
                      withShadow: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomContainer(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'Explanation',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 7,
                              ),
                              Flexible(
                                child: Text(
                                  explanation,
                                  maxLines: null,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      width: double.infinity,
                      backgroundColor: const Color.fromARGB(99, 210, 210, 210),
                      withShadow: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
