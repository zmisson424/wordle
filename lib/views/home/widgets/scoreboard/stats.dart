
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/cubit/stats_cubit.dart';
import 'package:wordle/views/home/widgets/scoreboard/distribution_graph.dart';
class Stats extends StatelessWidget {

  const Stats({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatsCubit>().state;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12
            ),
            child: Row(
              children: [
                _StatBlock(
                  title: 'Games Won', 
                  stat: stats.gamesWon.toStringAsFixed(0)
                ),
                _StatBlock(
                  title: 'Total Games', 
                  stat: stats.totalGames.toStringAsFixed(0)
                ),
                _StatBlock(
                  title: 'Current Streak', 
                  stat: stats.currentStreak.toStringAsFixed(0)
                ),
                _StatBlock(
                  title: 'Best Streak', 
                  stat: stats.bestStreak.toStringAsFixed(0)
                ),
              ],
            ),
          ),
          stats.gamesWon > 0 ?
          const DistributionGraph() : Container()
        ],
      ),
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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stat,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ),
    );
  }
}