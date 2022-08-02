import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';
import 'package:wordle/views/home/widgets/app_bar.dart';
import 'package:wordle/views/home/widgets/board/board.dart';
import 'package:wordle/views/home/widgets/game_won_dialog.dart';
import 'package:wordle/views/home/widgets/keyboard/index.dart';

class HomeView extends StatelessWidget {

  const HomeView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc()..add(CreateNewGame()),
      child: Scaffold(
        appBar: const WordleAppBar(),
        body: BlocListener<WordleBloc, WordleState>(
          listener: (context, state){
            if(state.gameState == GameState.won || state.gameState == GameState.lost){
              // Delay Dialog to allow user to see successful word
              Future.delayed(const Duration(seconds: 1), (){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: ((ctx) => GameOverDialog(
                    gameWon: state.gameState == GameState.won,
                    answer: state.answer,
                    onNewGame: (){
                      ctx.read<WordleBloc>().add(CreateNewGame());
                      Navigator.of(context).pop();
                    }
                  ))
                );
              });
            }
          },
          child: BlocBuilder<WordleBloc, WordleState>(
            builder: (context, state){
              if(state.gameState == GameState.loading){
                // TODO
                return Container();
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                padding: const EdgeInsets.all(
                  16
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Expanded(
                      child: WordleBoard(),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: OnScreenKeyboard(),
                    )
                  ],
                )
              );
            },
          ),
        )
      ),
    );
  }
}