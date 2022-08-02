import 'package:equatable/equatable.dart';

enum GuessAccuracy {
  miss,
  close,
  correct
}

enum GameState {
  loading,
  playing,
  won,
  lost
}
 
class WordleState extends Equatable {

  const WordleState({
    this.answer = 'guess',
    this.fullGuess = '',
    this.currentGuess = 1,
    this.guessAccuracy = const [],
    this.gameState = GameState.playing,
    this.letterHits = const {},
    this.timer = "00:00"
  });

  // The Wordle solution
  final String answer;

  // User input guesses
  final String fullGuess;

  // Current Guess Row
  final int currentGuess;

  // Guess rows
  final List<GuessAccuracy> guessAccuracy;

  // Where the game is at
  final GameState gameState;

  final Map<String, GuessAccuracy> letterHits;

  final String timer;

  @override
  List<Object> get props => [
    answer,
    fullGuess,
    currentGuess,
    guessAccuracy,
    gameState,
    letterHits,
    timer
  ];

  WordleState copyWith({
    String? answer,
    String? fullGuess,
    String? timer,
    int? currentGuess,
    List<GuessAccuracy>? guessAccuracy,
    GameState? gameState,
    Map<String, GuessAccuracy>? letterHits
  }) => WordleState(
    answer: answer ?? this.answer,
    fullGuess: fullGuess ?? this.fullGuess,
    timer: timer ?? this.timer,
    currentGuess: currentGuess ?? this.currentGuess,
    guessAccuracy: guessAccuracy ?? this.guessAccuracy,
    gameState: gameState ?? this.gameState,
    letterHits: letterHits ?? this.letterHits
  );
}