import 'package:flutter/material.dart';
import 'package:msd_project/ui/widgets/course_name.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CourseName(name: 'ML'),
            CourseName(name: 'Python'),
          ],
        ),
      ],
    );
  }
}
