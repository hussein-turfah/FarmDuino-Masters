import 'dart:developer';

import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/wdigets/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDashboard extends StatelessWidget {
  const ShimmerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
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
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: SizedBox(
                  height: 170,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(width: 16.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 170,
                              height: 160,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 170,
                              height: 160,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 170,
                              height: 160,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 180,
                            height: 190,
                            color: Colors.white,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            width: 180,
                            height: 190,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'Weather Forecast',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: SizedBox(
                      height: 170,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 250,
                              height: 140,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 250,
                              height: 190,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              width: 250,
                              height: 190,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
            heroTag: 'absar1',
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
