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

  Future<double?> fetchStat(String key) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<bool> writeStat(String key, double value) async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  Future<List<double>> fetchDistribution() async {
    List<double> results = [];
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    results.add(prefs.getDouble(kOneGameWins) ?? 0);
    results.add(prefs.getDouble(kTwoGameWins) ?? 0);
    results.add(prefs.getDouble(kThreeGameWins) ?? 0);
    results.add(prefs.getDouble(kFourGameWins) ?? 0);
    results.add(prefs.getDouble(kFiveGameWins) ?? 0);
    return results;
  }
}