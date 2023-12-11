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
    bool darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return AnimatedContainer(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          border: Border.all(
            // color: darkMode ?Colors.grey.shade50 : Colors.blueGrey.shade400,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(8),
          color: _getBlockColor(accuracy, context)),
      child: letter != null
          ? Text(
              letter!.toUpperCase(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          : Container(),
    );
  }

  Color _getBlockColor(GuessAccuracy? accuracy, BuildContext context) {
    switch (accuracy) {
      case GuessAccuracy.close:
        return Colors.yellow.shade400;
      case GuessAccuracy.correct:
        return Colors.green.shade500;
      case GuessAccuracy.miss:
        return Colors.blueGrey.shade100;
      default:
        return Theme.of(context).scaffoldBackgroundColor;
    }
  }
}
