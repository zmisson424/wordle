import 'package:flutter/material.dart';

class LetterCube extends StatelessWidget {

  const LetterCube({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade400,
        ),
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}