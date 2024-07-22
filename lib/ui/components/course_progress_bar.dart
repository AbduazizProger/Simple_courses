import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class CourseProgressBar extends StatefulWidget {
  const CourseProgressBar({super.key});

  @override
  State<CourseProgressBar> createState() => _CourseProgressBarState();
}

class _CourseProgressBarState extends State<CourseProgressBar> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return GestureDetector(
        onLongPressStart: (details) {
          isPressed = true;
          setState(() {});
        },
        onLongPressEnd: (details) {
          isPressed = false;
          setState(() {});
        },
        child: AnimatedContainer(
          height: isPressed ? 100 : 65,
          duration: const Duration(milliseconds: 140),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedAlign(
                  alignment:
                      isPressed ? Alignment.center : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 150),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 150),
                    style: TextStyle(
                      fontSize: isPressed ? 33 : 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ScheherazadeNew',
                      color: themeDefiner.themeMode.name == 'light'
                          ? Colors.black
                          : Colors.white,
                    ),
                    child: const Text('15/33'),
                  ),
                ),
                AnimatedContainer(
                  height: isPressed ? 18 : 5,
                  duration: const Duration(milliseconds: 100),
                  child: LinearProgressIndicator(
                    value: 0.43,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
