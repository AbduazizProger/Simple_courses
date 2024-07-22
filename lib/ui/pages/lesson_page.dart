import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msd_project/ui/components/marquee.dart';
import 'package:msd_project/ui/components/show_component.dart';
import 'package:msd_project/ui/pages/quiz_page.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({
    super.key,
    required this.content,
    required this.index,
    required this.name,
  });

  final int index;
  final String name;
  final List<String> content;

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Scaffold(
        appBar: AppBar(
          title: MarqueeWidget(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.content[0].split("Title:")[1],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ScheherazadeNew',
                  color: themeDefiner.themeMode.name == 'light'
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: widget.content.length,
            itemBuilder: (context, index) {
              if (widget.content.length - 1 > index) {
                return ShowComponent(content: widget.content[index + 1]);
              }
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) {
                        return QuizPage(
                            whichQuiz: widget.index, name: widget.name);
                      }),
                    );
                  },
                  child: const Text(
                    'Open quiz',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
