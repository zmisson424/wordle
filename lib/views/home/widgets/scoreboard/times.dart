import 'package:flutter/material.dart';

class TopTimes extends StatelessWidget {

  const TopTimes({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext ctx, int index){
          return Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16
                  ),
                  child: Text(
                    '08:13 - July 29, 2022'
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}