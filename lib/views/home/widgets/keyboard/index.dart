import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/views/home/widgets/keyboard/backspace_key.dart';
import 'package:wordle/views/home/widgets/keyboard/enter_key.dart';
import 'package:wordle/views/home/widgets/keyboard/keyboard_key.dart';

const topRowChars = [
  'Q',
  'W',
  'E',
  'R',
  'T',
  'Y',
  'U',
  'I',
  'O',
  'P',
];

const middleRowChars = [
  'a',
  's',
  'd',
  'f',
  'g',
  'h',
  'j',
  'k',
  'l',
];

const bottomRowChars = [
  'sub',
  'z',
  'x',
  'c',
  'v',
  'b',
  'n',
  'm',
  'del',
];

class OnScreenKeyboard extends StatelessWidget {
  const OnScreenKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyGuesses = context.watch<WordleBloc>().state.letterHits;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 300,
        maxWidth: 600,
        minWidth: 300,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: topRowChars.map((c) {
              double padding = 4;
              if (c == topRowChars[topRowChars.length - 1]) {
                padding = 0;
              }
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: KeyboardKey(
                    letter: c,
                    keyGuess: keyGuesses[c.toUpperCase()],
                  ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: middleRowChars.map((c) {
                double padding = 4;
                if (c == middleRowChars[middleRowChars.length - 1]) {
                  padding = 0;
                }
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: padding),
                    child: KeyboardKey(
                      letter: c,
                      keyGuess: keyGuesses[c.toUpperCase()],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            children: bottomRowChars.map((c) {
              if (c == 'del') {
                return const BackspaceKey();
              }

              if (c == 'sub') {
                return const EnterKey();
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: KeyboardKey(
                    letter: c,
                    keyGuess: keyGuesses[c.toUpperCase()],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
