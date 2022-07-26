import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class GameOverDialog extends StatelessWidget {

  const GameOverDialog({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WordleBloc, WordleState>(
      listener: (ctx, state){
        if(state.gameState == GameState.won){
          print("The Game has been WON");
        }
        
        if(state.gameState == GameState.lost){
          print("LOSER");
        }
      },
      child: Container(),
    );
  }
}