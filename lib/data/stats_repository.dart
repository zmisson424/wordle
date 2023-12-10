import 'package:shared_preferences/shared_preferences.dart';

class StatsRepository {

  // Games Statistics Constants
  static const String kTotalGames = 'TOTAL_GAMES';
  static const String kGamesWon = 'GAMES_WON';
  static const String kCurrentStreak = 'CURRENT_STREAK';
  static const String kBestStreak = 'BEST_STREAK';

  // Games Distribution Constants
  static const String kOneGameWins = 'GAMES_WON_IN_ONE';
  static const String kTwoGameWins = 'GAMES_WON_IN_TWO';
  static const String kThreeGameWins = 'GAMES_WON_IN_THREE';
  static const String kFourGameWins = 'GAMES_WON_IN_FOUR';
  static const String kFiveGameWins = 'GAMES_WON_IN_FIVE';

  Future<int?> fetchStat(String key) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool> writeStat(String key, int value) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  Future<List<int>> fetchDistribution() async {
    List<int> results = [];
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    results.add(prefs.getInt(kOneGameWins) ?? 0);
    results.add(prefs.getInt(kTwoGameWins) ?? 0);
    results.add(prefs.getInt(kThreeGameWins) ?? 0);
    results.add(prefs.getInt(kFourGameWins) ?? 0);
    results.add(prefs.getInt(kFiveGameWins) ?? 0);
    return results;
  }
}