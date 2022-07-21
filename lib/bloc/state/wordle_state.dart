import 'package:equatable/equatable.dart';

enum GuessAccuracy {
  miss,
  close,
  correct
}
 
class WordleState extends Equatable {

  const WordleState({
    this.answer = 'guess',
    this.fullGuess = '',
    this.currentGuess = 1,
    this.guessAccuracy = const []
  });

  // The Wordle solution
  final String answer;

  // User input guesses
  final String fullGuess;

  // Current Guess Row
  final int currentGuess;

  final List<GuessAccuracy> guessAccuracy;

  @override
  List<Object> get props => [
    answer,
    fullGuess,
    currentGuess,
    guessAccuracy
  ];

  WordleState copyWith({
    String? answer,
    String? fullGuess,
    int? currentGuess,
    List<GuessAccuracy>? guessAccuracy
  }) => WordleState(
    answer: answer ?? this.answer,
    fullGuess: fullGuess ?? this.fullGuess,
    currentGuess: currentGuess ?? this.currentGuess,
    guessAccuracy: guessAccuracy ?? this.guessAccuracy
  );
}