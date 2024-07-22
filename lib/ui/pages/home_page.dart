import 'package:flutter/material.dart';
import 'package:msd_project/ui/widgets/profile_content.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/models/theme_changer.dart';
import 'package:msd_project/ui/widgets/home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(
      builder: (context, themeDefiner, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Teach me'),
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
          body: PageView.builder(
            itemCount: 2,
            onPageChanged: (int value) {
              pageIndex = value;
              setState(() {});
            },
            controller: pageController,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const HomeContent();
              }
              return const ProfileContent();
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) {
          //         return const CodeEditorPage();
          //       }),
          //     );
          //   },
          //   child: const Icon(Icons.edit_document),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (value) {
              pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 350),
                curve: Curves.ease,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded),
                label: 'Main',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
