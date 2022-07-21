import 'package:flutter/material.dart';

class BackspaceKey extends StatelessWidget {

  const BackspaceKey({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell(
        onTap: () => print("Clicked"),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          width: 58,
          height: 48,
          child: const Icon(
            Icons.backspace_outlined
          ),
        ),
      ),
    );
  }
}