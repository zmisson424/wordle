import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/views/home/widgets/board.dart';
import 'package:wordle/views/home/widgets/keyboard/index.dart';

class HomeView extends StatelessWidget {

  const HomeView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc(),
      child: Scaffold(
        body: Container(
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
        ),
      ),
    );
  }
}