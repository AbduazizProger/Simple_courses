import 'package:flutter/material.dart';

class ShowQuizComponent extends StatefulWidget {
  const ShowQuizComponent({super.key, required this.component});

  final String component;

  @override
  State<ShowQuizComponent> createState() => _ShowQuizComponentState();
}

class _ShowQuizComponentState extends State<ShowQuizComponent> {
  bool isSelected = false;

  void changeState() {
    isSelected = !isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.component.contains('Question:')) {
      return Text(
        widget.component.split('Question:')[1],
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      );
    } else if (widget.component.contains('VariantA:')) {
      return InkWell(
        onTap: changeState,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 180,
          height: 180,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green[800] : Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.component.split('VariantA:')[1],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (widget.component.contains('VariantB:')) {
      return InkWell(
        onTap: changeState,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 180,
          height: 180,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.component.split('VariantB:')[1],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (widget.component.contains('VariantC:')) {
      return InkWell(
        onTap: changeState,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 180,
          height: 180,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.component.split('VariantC:')[1],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: changeState,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 180,
        height: 180,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.component.split('VariantD:')[1],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
