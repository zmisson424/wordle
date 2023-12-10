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
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12
        ),
        itemCount: 10,
        itemBuilder: (BuildContext ctx, int index){
          return Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 12,
              bottom: 12
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}.',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20
                  ),
                  child: Text(
                    '08:13',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 8
                  ),
                  child: Text(
                    'July 29, 2022',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),
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