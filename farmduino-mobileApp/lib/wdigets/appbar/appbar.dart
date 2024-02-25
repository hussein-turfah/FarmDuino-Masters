import 'package:farmduino/constants/colors.dart';
import 'package:farmduino/constants/routs.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool displaySettingsIcon;
  const CustomAppBar({super.key, required this.displaySettingsIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Farmduino'),
      centerTitle: true,
      backgroundColor: CustomColors.pageBackgroundColor,
      actions: [
        (displaySettingsIcon)
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(settingsPage);
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 33,
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
