import 'package:flutter/material.dart';
import 'package:msd_project/functions/read_file.dart';
import 'package:msd_project/ui/widgets/lesson_name.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class LessonsList extends StatefulWidget {
  const LessonsList({super.key, required this.name});

  final String name;

  @override
  State<LessonsList> createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  List<List<String>> courseContents = [];

  Future<void> readAllContent() async {
    for (var i = 0; i < 5; i++) {
      courseContents.add(
        (await readTextFile(
                'assets/courses/${widget.name.toLowerCase()}/content/$i.txt'))
            .split("\n"),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    readAllContent().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Scaffold(
          appBar: AppBar(
            title: Text('${widget.name} - Lessons'),
            titleTextStyle: TextStyle(
              fontFamily: 'ScheherazadeNew',
              fontWeight: FontWeight.bold,
              color: themeDefiner.themeMode.name == 'light'
                  ? Colors.black
                  : Colors.white,
              fontSize: 35,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.keyboard_arrow_down, size: 35),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: courseContents.length,
            itemBuilder: (context, index) {
              return LessonName(
                index: index,
                name: widget.name,
                content: courseContents,
              );
            },
          ),
        ),
      );
    });
  }
}
