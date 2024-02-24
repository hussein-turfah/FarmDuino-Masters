import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/container/container.dart';
import 'package:flutter/material.dart';

class Plantdetails extends StatelessWidget {
  final String plantName;
  final int temp;
  final int humidity;
  final int light;
  final int soilMoisture;

  const Plantdetails({
    super.key,
    required this.temp,
    required this.humidity,
    required this.light,
    required this.soilMoisture,
    required this.plantName,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      height: 510,
      backgroundColor: CustomColors.cardColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/banana.jpg',
                    ),
                    width: 130,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Planet species',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Text(
                      plantName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            planetSliders(
              temp,
              'Temperature',
              context,
              '°C',
              10,
              50,
            ),
            const SizedBox(
              height: 10,
            ),
            planetSliders(
              humidity,
              'Humidity',
              context,
              '%',
              0,
              100,
            ),
            const SizedBox(
              height: 10,
            ),
            planetSliders(
              light,
              'Light intensity',
              context,
              'lx',
              0,
              2000,
            ),
            const SizedBox(
              height: 10,
            ),
            planetSliders(
              soilMoisture,
              'Soil moisture',
              context,
              '%',
              0,
              100,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget planetSliders(int value, String title, BuildContext context,
      String unit, double min, double max) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$value $unit',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 0,
            ),
          ),
          child: Slider(
            value: value.toDouble(),
            min: min,
            max: max,
            activeColor: CustomColors.detailsColor,
            thumbColor: null,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
