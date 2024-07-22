import 'package:flutter/material.dart';
import 'package:msd_project/models/theme_changer.dart';

class NightThemeWidget extends StatelessWidget {
  const NightThemeWidget({super.key, required this.themeDefiner});

  final ThemeDefiner themeDefiner;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Text(
              "Tungi rejim ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'ScheherazadeNew',
              ),
            ),
            Icon(
              themeDefiner.themeMode.name == 'dark'
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ],
        ),
        Switch(
          value: themeDefiner.themeMode.name == 'dark',
          onChanged: (value) {
            themeDefiner.changeTheme();
          },
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
          inactiveTrackColor: Colors.grey,
          inactiveThumbColor: Colors.white,
        ),
      ],
    );
  }
}
