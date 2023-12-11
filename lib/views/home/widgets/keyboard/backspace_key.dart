import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/theme/colors.dart';

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Material(
      color: darkMode ? AppColors.keyboardDark : AppColors.keyboardLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          HapticFeedback.heavyImpact();
          context.read<WordleBloc>().add(BackspacePressed());
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          width: 58,
          height: 48,
          child: const Icon(Icons.backspace_outlined),
        ),
      ),
    );
  }
}
