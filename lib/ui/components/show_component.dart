import 'package:flutter/material.dart';

class ShowComponent extends StatelessWidget {
  const ShowComponent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    if (content.contains('Bold:')) {
      return Text(
        content.split('Bold:')[1],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      );
    } else if (content.contains('Code:')) {
      return Container(
        color: Colors.grey[600],
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 20),
        child: Text(
          content.split('Code:')[1],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    } else if (content.contains('Like-code')) {
      return Container(
        color: Colors.grey[600],
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 20),
        child: Text(
          content.split('Like-code:')[1],
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      );
    } else if (content.contains('Image')) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(content.split('Image:')[1].split(' ')[0]),
        ),
      );
    } else if (content.contains('Table-Row')) {
      return Table(
        children: [
          TableRow(
            children: List.generate(
              content.split('Table-Row:')[1].split(',').length,
              (index) => Text(content.split('Table-Row:')[1].split(',')[index]),
            ),
          ),
        ],
      );
    }
    return Text(
      content.split('Text:')[1],
      style: const TextStyle(fontSize: 16),
    );
  }
}
