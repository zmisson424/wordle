import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';
import 'package:wordle/theme/colors.dart';

class KeyboardKey extends StatelessWidget {

  const KeyboardKey({
    Key? key,
    required this.letter,
    this.keyGuess
  }) : super(key: key);

  // Letter to be displayed
  final String letter;

  final GuessAccuracy? keyGuess;

  @override
  Widget build(BuildContext context) {
    bool darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Material(
      color: _keyColor(darkMode),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: (){
          HapticFeedback.heavyImpact();
          context.read<WordleBloc>().add(LetterKeyPressed(letter));
        },
        enableFeedback: true,
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

  Color _keyColor(bool darkMode){
    switch(keyGuess){
      case GuessAccuracy.correct:
        return darkMode ? AppColors.correctDark : AppColors.correctLight;
      case GuessAccuracy.close:
        return darkMode ? AppColors.closeDark : AppColors.closeLight;
      case GuessAccuracy.miss:
        return darkMode ? AppColors.missDark : AppColors.missLight;
      default:
        return darkMode ? AppColors.keyboardDark : AppColors.keyboardLight;
    }
  }
}