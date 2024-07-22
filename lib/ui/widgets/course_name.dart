import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msd_project/ui/pages/course_page.dart';

class CourseName extends StatelessWidget {
  const CourseName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) {
            return CoursePage(name: name);
          }),
        );
      },
      child: Container(
        width: 170,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '15/33',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.play_circle, size: 32, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
