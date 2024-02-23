import 'package:flutter/material.dart';

class EmptyGreenHouseList extends StatelessWidget {
  const EmptyGreenHouseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/greenhouse.png',
            scale: 3,
          ),
          const Text(
            "Your greenhouse list is empty!",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
