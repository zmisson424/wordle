import 'package:flutter/material.dart';
import 'package:wordle/views/home/widgets/letter_cube.dart';

class HomeView extends StatelessWidget {

  const HomeView({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        padding: const EdgeInsets.all(
          16
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12
          ),
          itemCount: 25,
          itemBuilder: ((context, index) => 
            const LetterCube()
          )
        )
      ),
    );
  }
}