import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';
import 'package:msd_project/ui/components/night_theme.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Bizni baholang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'ScheherazadeNew',
                ),
              ),
              const SizedBox(width: 0),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Rahmat sizga !!!"),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.rate_review, size: 30),
              )
            ],
          ),
          NightThemeWidget(themeDefiner: themeDefiner),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Chiqish",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'ScheherazadeNew',
                ),
              ),
              const SizedBox(width: 0),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Chiqishni istaysizmi ?"),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yo'q"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Ha"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.exit_to_app, size: 30),
              )
            ],
          ),
        ],
      );
    });
  }
}
