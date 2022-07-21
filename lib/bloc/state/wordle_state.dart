import 'package:equatable/equatable.dart';

class WordleState extends Equatable {

  const WordleState({
    this.answer = 'guess',
    this.fullGuess = ''
  });

  // The Wordle solution
  final String answer;

  // User input guesses
  final String fullGuess;

  @override
  List<Object> get props => [
    answer,
    fullGuess
  ];

  WordleState copyWith({
    String? answer,
    String? fullGuess
  }) => WordleState(
    answer: answer ?? this.answer,
    fullGuess: fullGuess ?? this.fullGuess
  );
}