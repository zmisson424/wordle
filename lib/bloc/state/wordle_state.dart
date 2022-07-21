import 'package:equatable/equatable.dart';

class WordleState extends Equatable {

  const WordleState({
    this.answer = 'guess'
  });

  // The Wordle solution
  final String answer;

  @override
  List<Object> get props => [
    answer
  ];

  WordleState copyWith({
    String? answer
  }) => WordleState(
    answer: answer ?? this.answer
  );
}