

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/state/stats_state.dart';
import 'package:wordle/data/stats_repository.dart';

class StatsCubit extends Cubit<StatsState> {
  
  StatsCubit() : super(const StatsState());

  Future<void> fetchStats() async {
    int gamesWon = await StatsRepository().fetchStat(StatsRepository.kGamesWon) ?? 0;
    int totalGames = await StatsRepository().fetchStat(StatsRepository.kTotalGames) ?? 0;
    int currentStreak = await StatsRepository().fetchStat(StatsRepository.kCurrentStreak) ?? 0;
    int bestStreak = await StatsRepository().fetchStat(StatsRepository.kBestStreak) ?? 0;

    List<int> winDistribution = await StatsRepository().fetchDistribution();

    emit(state.copyWith(
      gamesWon: gamesWon,
      totalGames: totalGames,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      winDistribution: winDistribution
    ));
  }
}