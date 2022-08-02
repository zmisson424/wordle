import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';

class GameOverDialog extends StatelessWidget {

  const GameOverDialog({
    Key? key,
    required this.gameWon,
    required this.onNewGame
  }) : super(key: key);

  final bool gameWon;

  final Function() onNewGame;

  @override
  Widget build(BuildContext context) {
    final answer = context.watch<WordleBloc>().state.letterHits;
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.gameOver
      ),
      content: SizedBox(
        child: Column(
          children: [
            Text(
              gameWon ? AppLocalizations.of(context)!.wonMessage : 
              AppLocalizations.of(context)!.lostMessage
            ),
            Text(
              'The answer was $answer'
            )
          ],
        )
      ),
      actions: [
        TextButton(
          onPressed: onNewGame, 
          child: Text(
            AppLocalizations.of(context)!.newGame
          )
        )
      ],
    );
  }
}