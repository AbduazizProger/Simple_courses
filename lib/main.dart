import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msd_project/ui/pages/home_page.dart';
import 'package:msd_project/models/theme_changer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeMode themeMode;
  if (prefs.getBool('isDark') ?? false) {
    themeMode = ThemeMode.dark;
  } else {
    themeMode = ThemeMode.light;
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeDefiner(themeMode: themeMode, prefs: prefs),
        ),
        Provider(create: (_) => prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDefiner>(builder: (context, themeDefiner, child) {
      return MaterialApp(
        title: 'Teach me',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(useMaterial3: true),
        themeMode: themeDefiner.themeMode,
        home: const HomePage(),
      );
    });
  }
}
