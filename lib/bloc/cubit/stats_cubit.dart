

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/state/stats_state.dart';
import 'package:wordle/data/stats_repository.dart';

class StatsCubit extends Cubit<StatsState> {
  
  StatsCubit() : super(const StatsState());

  final StatsRepository _statsRepository = StatsRepository();

  Future<void> fetchStats() async {
    int gamesWon = await _statsRepository.fetchStat(StatsRepository.kGamesWon) ?? 0;
    int totalGames = await _statsRepository.fetchStat(StatsRepository.kTotalGames) ?? 0;
    int currentStreak = await _statsRepository.fetchStat(StatsRepository.kCurrentStreak) ?? 0;
    int bestStreak = await _statsRepository.fetchStat(StatsRepository.kBestStreak) ?? 0;

    List<int> winDistribution = await _statsRepository.fetchDistribution();

    emit(state.copyWith(
      gamesWon: gamesWon,
      totalGames: totalGames,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      winDistribution: winDistribution
    ));
  }
}