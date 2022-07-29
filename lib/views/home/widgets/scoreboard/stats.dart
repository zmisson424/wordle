import 'package:flutter/material.dart';

class Stats extends StatelessWidget {

  const Stats({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Row(
            children: const [
              _StatBlock(
                title: 'Games Won', 
                stat: '12'
              ),
              _StatBlock(
                title: 'Games Played', 
                stat: '14'
              ),
              _StatBlock(
                title: 'Current Streak', 
                stat: '2'
              ),
              _StatBlock(
                title: 'Best Streak', 
                stat: '4'
              ),
            ],
          )
      ],
    );
  }
}

class _StatBlock extends StatelessWidget {

  const _StatBlock({
    Key? key,
    required this.title,
    required this.stat
  }) : super(key: key);

  final String title;

  final String stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stat,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14
          ),
        )
      ],
    );
  }
}