import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';

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
        onTap: () => context.read<WordleBloc>().add(LetterKeyPressed(letter)),
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