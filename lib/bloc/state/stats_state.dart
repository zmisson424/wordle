import 'package:equatable/equatable.dart';
 
class StatsState extends Equatable {

  const StatsState({
    this.totalGames = 0,
    this.gamesWon = 0,
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.winDistribution = const []
  });

  // Counter of total games played
  final int totalGames;

  // Counter of total games won
  final int gamesWon;

  // Current Streak count
  final int currentStreak;

  // Overall best streak
  final int bestStreak;

  // Distribution of guess win
  final List<int> winDistribution;

  @override
  List<Object> get props => [
    totalGames,
    gamesWon,
    currentStreak,
    bestStreak,
    winDistribution
  ];

  StatsState copyWith({
    int? totalGames,
    int? gamesWon,
    int? currentStreak,
    int? bestStreak,
    List<int>? winDistribution
  }) => StatsState(
    totalGames: totalGames ?? this.totalGames,
    gamesWon: gamesWon ?? this.gamesWon,
    currentStreak: currentStreak ?? this.currentStreak,
    bestStreak: bestStreak ?? this.bestStreak,
    winDistribution: winDistribution ?? this.winDistribution
  );
}