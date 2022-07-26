import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {

  WordleBloc() : super( const WordleState()) {
    on<LetterKeyPressed>(_onLetterKeyPressed);
    on<BackspacePressed>(_onBackspacePressed);
    on<SubmitPressed>(_onSubmitPressed);
    on<GameOver>(_onGameOver);
  }

  Future<void> _onLetterKeyPressed(LetterKeyPressed event, Emitter<WordleState> emit) async {

    int maxLength = state.currentGuess * 5;

    if(state.fullGuess.length < maxLength){
      emit(state.copyWith(
        fullGuess: state.fullGuess + event.letter,
      ));
    }
  }

  Future<void> _onBackspacePressed(BackspacePressed event, Emitter<WordleState> emit) async {

    String guesses = state.fullGuess;
    int minLength = state.currentGuess * 5 - 5;
    if(guesses.isNotEmpty && guesses.length > minLength) {
      guesses = guesses.substring(0, guesses.length - 1);
    }

    emit(state.copyWith(
      fullGuess: guesses
    ));
  }

  Future<void> _onSubmitPressed(SubmitPressed event, Emitter<WordleState> emit) async {
    int maxLength = state.currentGuess * 5;
    if(state.fullGuess.length == maxLength){
      // Check Answer

      String currentGuess = state.fullGuess.substring(maxLength - 5, maxLength);
      List<GuessAccuracy> accuracy = [...state.guessAccuracy];

      // Compare Letters
      for(int i = 0; i < 5; i++){
        if(currentGuess[i].toUpperCase() == state.answer[i].toUpperCase()){
          accuracy.add(GuessAccuracy.correct);
        }
        else if(state.answer.contains(currentGuess[i])){
          accuracy.add(GuessAccuracy.close);
        }
        else {
          accuracy.add(GuessAccuracy.miss);
        }
      }

      emit(state.copyWith(
        currentGuess: state.currentGuess + 1,
        guessAccuracy: accuracy
      ));

      if(currentGuess.toUpperCase() == state.answer.toUpperCase()){
        add(const GameOver(true));
      }
      else if(state.fullGuess.length >= 25){
        add(const GameOver(false));
      }
    }
  }

  Future<void> _onGameOver(GameOver event, Emitter<WordleState> emit) async {
    if(event.gameWon){
      emit(state.copyWith(
        gameState: GameState.won
      ));
    }
    else{
      emit(state.copyWith(
        gameState: GameState.lost
      ));
    }
  }
}