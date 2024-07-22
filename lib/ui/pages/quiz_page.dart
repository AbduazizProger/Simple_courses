import 'package:flutter/material.dart';
import 'package:msd_project/functions/read_file.dart';
import 'package:msd_project/ui/components/show_quiz_component.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.whichQuiz, required this.name});

  final String name;
  final int whichQuiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> quiz = [];

  Future<void> readQuiz() async {
    quiz.addAll(
      (await readTextFile(
              'assets/courses/${widget.name.toLowerCase()}/quiz/${widget.whichQuiz}.txt'))
          .split("\n"),
    );
  }

  @override
  void initState() {
    super.initState();
    readQuiz().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'ScheherazadeNew',
              color: themeDefiner.themeMode.name == 'light'
                  ? Colors.black
                  : Colors.white,
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
        body: quiz.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(child: ShowQuizComponent(component: quiz[0])),
                  Column(
                    children: [
                      Row(
                        children: [
                          Center(child: ShowQuizComponent(component: quiz[1])),
                          Center(child: ShowQuizComponent(component: quiz[2])),
                        ],
                      ),
                      Row(
                        children: [
                          Center(child: ShowQuizComponent(component: quiz[3])),
                          Center(child: ShowQuizComponent(component: quiz[4])),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox(),
      );
    });
  }
}
