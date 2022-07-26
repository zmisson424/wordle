import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class GameOverDialog extends StatelessWidget {

  const GameOverDialog({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WordleBloc, WordleState>(
      listener: (ctx, state){
        if(state.gameState == GameState.won || state.gameState == GameState.lost){
          _showDialog(state.gameState == GameState.won, ctx, () => ctx.read<WordleBloc>().add(CreateNewGame()));
        }
      },
      child: Container(),
    );
  }

  void _showDialog(bool winner, BuildContext context, Function() onNewGame){
    Future.delayed(const Duration(seconds: 1), (){
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.gameOver
            ),
            content: SizedBox(
              child: Text(
                winner ? AppLocalizations.of(context)!.wonMessage : 
                AppLocalizations.of(context)!.lostMessage
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  onNewGame();
                  Navigator.of(context).pop();
                }, 
                child: Text(
                  AppLocalizations.of(context)!.newGame
                )
              )
            ],
          );
        }
      );
    });
  }
}