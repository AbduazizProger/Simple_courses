import 'package:flutter/services.dart';

Future<String> readTextFile(String filePath) async {
  return await rootBundle.loadString(filePath);
}
