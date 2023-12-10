import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import './letter_cube.dart';

class WordleBoard extends StatelessWidget {
  const WordleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userGuess = context.watch<WordleBloc>().state.fullGuess;
    final accuracies = context.watch<WordleBloc>().state.guessAccuracy;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
        minWidth: 300,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 25,
        itemBuilder: (context, index) {
          String? letter;

          if (index < userGuess.length) {
            letter = userGuess[index];
          }

          return LetterCube(
            letter: letter,
            accuracy: accuracies.length > index ? accuracies[index] : null,
          );
        },
      ),
    );
  }
}
