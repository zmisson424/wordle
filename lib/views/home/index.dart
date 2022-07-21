import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/bloc/wordle_bloc.dart';
import 'package:wordle/views/home/widgets/keyboard/index.dart';
import 'package:wordle/views/home/widgets/letter_cube.dart';

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
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 25,
                  itemBuilder: ((context, index) => 
                    const LetterCube()
                  )
                ),
              ),
              const SizedBox(
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