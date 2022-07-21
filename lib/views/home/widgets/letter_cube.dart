import 'package:flutter/material.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class LetterCube extends StatelessWidget {

  const LetterCube({
    Key? key,
    this.letter,
    this.accuracy,
  }) : super(key: key);

  final String? letter;

  final GuessAccuracy? accuracy;

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
        borderRadius: BorderRadius.circular(8),
        color: accuracy == GuessAccuracy.correct ? 
          Colors.green.shade500 : accuracy == GuessAccuracy.close ? 
          Colors.yellow.shade400 : Colors.transparent
      ),
      child: letter != null ? Text(
        letter!.toUpperCase(),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ): Container(),
    );
  }
}