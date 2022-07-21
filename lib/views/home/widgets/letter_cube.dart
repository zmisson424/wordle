import 'package:flutter/material.dart';

class LetterCube extends StatelessWidget {

  const LetterCube({
    Key? key,
    this.letter
  }) : super(key: key);

  final String? letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade400,
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: letter != null ? Text(
        letter!,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ): Container(),
    );
  }
}