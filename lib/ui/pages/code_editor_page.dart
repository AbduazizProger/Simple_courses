import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';

class CodeEditorPage extends StatelessWidget {
  const CodeEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Code editor'),
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
      );
    });
  }
}
