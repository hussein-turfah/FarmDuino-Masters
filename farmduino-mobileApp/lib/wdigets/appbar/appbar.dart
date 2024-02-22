import 'package:farmduino/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Farmduino'),
      centerTitle: true,
      backgroundColor: CustomColors.pageBackgroundColor,
      actions: const [
        Icon(
          Icons.settings_outlined,
          size: 33,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
