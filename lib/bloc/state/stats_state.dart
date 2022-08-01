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
  final double totalGames;

  // Counter of total games won
  final double gamesWon;

  // Current Streak count
  final double currentStreak;

  // Overall best streak
  final double bestStreak;

  // Distribution of guess win
  final List<double> winDistribution;

  @override
  List<Object> get props => [
    totalGames,
    gamesWon,
    currentStreak,
    bestStreak,
    winDistribution
  ];

  StatsState copyWith({
    double? totalGames,
    double? gamesWon,
    double? currentStreak,
    double? bestStreak,
    List<double>? winDistribution
  }) => StatsState(
    totalGames: totalGames ?? this.totalGames,
    gamesWon: gamesWon ?? this.gamesWon,
    currentStreak: currentStreak ?? this.currentStreak,
    bestStreak: bestStreak ?? this.bestStreak,
    winDistribution: winDistribution ?? this.winDistribution
  );
}