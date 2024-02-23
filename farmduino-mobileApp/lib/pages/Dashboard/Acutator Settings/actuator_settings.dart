import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/container/container.dart';
import 'package:flutter/material.dart';

class ActuatorSettings extends StatefulWidget {
  final Size size;
  final bool isSlidable;
  final String title;
  const ActuatorSettings(
      {super.key,
      required this.size,
      required this.isSlidable,
      required this.title});

  @override
  State<ActuatorSettings> createState() => _AcutatorSettingsState();
}

class _AcutatorSettingsState extends State<ActuatorSettings> {
  double tempSlider = 27;
  double lightSlider = 1000;
  bool isFansOn = true;
  bool isLightsOn = true;

  @override
  Widget build(BuildContext context) {
    int temp = (tempSlider).toInt();
    int light = (lightSlider).toInt();
    return CustomContainer(
      width: double.infinity,
      height: 70,
      backgroundColor: CustomColors.cardColor,
      body: (widget.isSlidable)
          ? sliders(
              size: widget.size,
              variable: (widget.title == "Range of temperature") ? temp : light,
              title: widget.title,
            )
          : cardWithButton(
              title: widget.title,
            ),
    );
  }

  Widget sliders({
    required Size size,
    required int variable,
    required String title,
  }) {
    Widget icon;
    if (title == "Range of temperature") {
      icon = const Icon(
        Icons.thermostat,
        size: 35,
      );
    } else if (title == "Range of light") {
      icon = const Icon(
        Icons.lightbulb,
        size: 35,
      );
    } else {
      icon = const Icon(
        Icons.forest,
        size: 35,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        icon,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: size.width - 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  (title == "Range of temperature")
                      ? Text(
                          '$variable°C',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          '$variable lx',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 75,
              height: 40,
              child: Slider(
                value: (title == "Range of temperature")
                    ? tempSlider
                    : lightSlider,
                thumbColor: CustomColors.detailsColor,
                activeColor: CustomColors.detailsColor,
                max: (title == "Range of temperature") ? 50 : 2000,
                min: (title == "Range of temperature") ? 10 : 500,
                onChanged: (value) {
                  setState(
                    () {
                      if (title == "Range of temperature") {
                        tempSlider = value;
                      } else if (title == "Range of light") {
                        lightSlider = value;
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cardWithButton({
    required String title,
  }) {
    Widget icon;
    if (title == "Set fans ON/OFF manually") {
      icon = Image.asset(
        'assets/icons/fan.png',
        width: 35,
      );
    } else if (title == "Set lights ON/OFF manually") {
      icon = Image.asset(
        'assets/icons/light_bulb.png',
        width: 35,
        color: Colors.black,
      );
    } else {
      icon = const Icon(
        Icons.forest,
        size: 35,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 1,
            ),
            icon,
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Switch(
          value: (title == "Set fans ON/OFF manually") ? isFansOn : isLightsOn,
          activeColor: Colors.white,
          activeTrackColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              if (title == "Set fans ON/OFF manually") {
                isFansOn = !isFansOn;
              } else if (title == "Set lights ON/OFF manually") {
                isLightsOn = !isLightsOn;
              }
            });
          },
        )
      ],
    );
  }
}
