import 'package:equatable/equatable.dart';

class WordleState extends Equatable {

  const WordleState({
    this.answer = 'guess',
    this.fullGuess = '',
    this.currentGuess = 1
  });

  // The Wordle solution
  final String answer;

  // User input guesses
  final String fullGuess;

  // Current Guess Row
  final int currentGuess;

  @override
  List<Object> get props => [
    answer,
    fullGuess,
    currentGuess
  ];

  WordleState copyWith({
    String? answer,
    String? fullGuess,
    int? currentGuess
  }) => WordleState(
    answer: answer ?? this.answer,
    fullGuess: fullGuess ?? this.fullGuess,
    currentGuess: currentGuess ?? this.currentGuess
  );
}