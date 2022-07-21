import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';

class EnterKey extends StatelessWidget {

  const EnterKey({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 4
      ),
      child: Material(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: InkWell(
          onTap: () => context.read<WordleBloc>().add(SubmitPressed()),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: Alignment.center,
            width: 58,
            height: 48,
            child: const Icon(
              Icons.send_outlined
            ),
          ),
        ),
      ),
    );
  }
}