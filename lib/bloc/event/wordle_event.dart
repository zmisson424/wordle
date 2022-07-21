import 'package:equatable/equatable.dart';

abstract class WordleEvent extends Equatable {
  
  const WordleEvent();

  @override
  List<Object> get props => [];
}

class LetterKeyPressed extends WordleEvent {

  const LetterKeyPressed(this.letter);

  final String letter;

  List<Object> get props => [
    letter
  ];
}