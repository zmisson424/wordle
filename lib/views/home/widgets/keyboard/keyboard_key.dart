import 'package:flutter/material.dart';

class KeyboardKey extends StatelessWidget {

  const KeyboardKey({
    Key? key,
    required this.letter
  }) : super(key: key);

  // Letter to be displayed
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: () => print("Clicked"),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 48,
          child: Text(
            letter.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}