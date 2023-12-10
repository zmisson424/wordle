import 'package:equatable/equatable.dart';

abstract class WordleEvent extends Equatable {
  
  const WordleEvent();

  @override
  List<Object> get props => [];
}

class LetterKeyPressed extends WordleEvent {

  const LetterKeyPressed(this.letter);

  final String letter;

  @override
  List<Object> get props => [
    letter
  ];
}

class BackspacePressed extends WordleEvent {}

class SubmitPressed extends WordleEvent {}

class GameOver extends WordleEvent {

  const GameOver(this.gameWon);

  final bool gameWon;

  @override
  List<Object> get props => [
    gameWon
  ];
}

class CreateNewGame extends WordleEvent {}

class GameLoading extends WordleEvent {}

class StartStopwatch extends WordleEvent{}

class StopStopwatch extends WordleEvent{}

class SetStopwatch extends WordleEvent{}