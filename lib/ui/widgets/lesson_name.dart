import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:msd_project/ui/pages/lesson_page.dart';

class LessonName extends StatelessWidget {
  const LessonName({
    super.key,
    required this.name,
    required this.index,
    required this.content,
  });

  final int index;
  final String name;
  final List<List<String>> content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) {
                  return LessonPage(
                    content: content[index],
                    index: index,
                    name: name,
                  );
                }),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                  name == 'ML'
                      ? 'assets/images/ml.jpg'
                      : 'assets/images/python.png',
                  width: 130),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name lesson $index",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "${content[index][0].split("Title:")[1].length > 16 ? content[index][0].split("Title:")[1].substring(0, 16) : content[index][0].split("Title:")[1]}...",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Icons.cancel
          const Icon(Icons.check_circle_sharp, color: Colors.green),
        ],
      ),
    );
  }
}
