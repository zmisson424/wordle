import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';

class WordleStopwatch extends StatelessWidget {

  const WordleStopwatch({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stopwatch = context.watch<WordleBloc>().state.stopwatch;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4
      ),
      alignment: Alignment.center,
      child: Text(
        "${stopwatch.elapsed.inMinutes}:${stopwatch.elapsed.inSeconds}"
      ),
    );
  }
}