import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameOverDialog extends StatelessWidget {

  const GameOverDialog({
    Key? key,
    required this.gameWon,
    required this.onNewGame,
    required this.answer
  }) : super(key: key);

  final bool gameWon;

  final String answer;

  final Function() onNewGame;

  @override
  Widget build(BuildContext context) {
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