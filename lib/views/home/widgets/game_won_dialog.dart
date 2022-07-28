import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.gameOver
      ),
      content: SizedBox(
        child: Text(
          gameWon ? AppLocalizations.of(context)!.wonMessage : 
          AppLocalizations.of(context)!.lostMessage
        ),
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