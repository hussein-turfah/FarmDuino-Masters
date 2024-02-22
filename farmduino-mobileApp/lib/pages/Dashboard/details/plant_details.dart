import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/container/container.dart';
import 'package:flutter/material.dart';

class Plantdetails extends StatelessWidget {
  const Plantdetails({super.key});

  @override
  Widget build(BuildContext context) {
    const int temp = 20;
    const int humidity = 35;
    const int light = 500;
    const int moisture = 75;
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Planet species',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      'Banana',
                      style: TextStyle(
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
              -10,
              45,
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
              1000,
            ),
            const SizedBox(
              height: 10,
            ),
            planetSliders(
              moisture,
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
