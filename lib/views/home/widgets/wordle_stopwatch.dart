import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';

class WordleStopwatch extends StatefulWidget {

  const WordleStopwatch({
    Key? key
  }) : super(key: key);

  @override
  WordleStopwatchState createState()=> WordleStopwatchState();
}

class WordleStopwatchState extends State<WordleStopwatch> {

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) { 
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timer = context.watch<WordleBloc>().state.timer;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4
      ),
      alignment: Alignment.center,
      child: Text(
        timer
      ),
    );
  }
}