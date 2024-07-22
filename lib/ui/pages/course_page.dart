import 'package:flutter/material.dart';
import 'package:msd_project/ui/components/course_progress_bar.dart';
import 'package:msd_project/ui/pages/lessons_list.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(name),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'ScheherazadeNew',
            fontWeight: FontWeight.bold,
            color: themeDefiner.themeMode.name == 'light'
                ? Colors.black
                : Colors.white,
            fontSize: 35,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return LessonsList(name: name);
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Image.asset(
                  name == 'ML'
                      ? 'assets/images/ml.jpg'
                      : 'assets/images/python.png',
                  height: 130,
                ),
              ),
            ),
            Text(
              name == 'ML'
                  ? "Machine learning (ML)\n is a field of study in artificial intelligence concerned with the development and study of statistical algorithms that can effectively generalize and thus perform tasks without explicit instructions. Recently, generative artificial neural networks have been able to surpass many previous approaches in performance. Machine learning approaches have been applied to large language models, computer vision, speech recognition, email filtering, agriculture, and medicine, where it is too costly to develop algorithms to perform the needed tasks. The mathematical foundations of ML are provided by mathematical optimization (mathematical programming) methods. Data mining is a related (parallel) field of study, focusing on exploratory data analysis through unsupervised learning. ML is known in its application across business problems under the name predictive analytics. Although not all machine learning is statistically based, computational statistics is an important source of the field's methods."
                  : """Python\n Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming. It is often described as a "batteries included" language due to its comprehensive standard library. Guido van Rossum began working on Python in the late 1980s as a successor to the ABC programming language and first released it in 1991 as Python 0.9.0.[34] Python 2.0 was released in 2000. Python 3.0, released in 2008, was a major revision not completely backward-compatible with earlier versions. Python 2.7.18, released in 2020, was the last release of Python 2.""",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                fontFamily: 'ScheherazadeNew',
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CourseProgressBar(),
      );
    });
  }
}
