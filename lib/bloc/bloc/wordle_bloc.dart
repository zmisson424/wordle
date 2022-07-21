import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {

  WordleBloc() : super( const WordleState()) {
    on<LetterKeyPressed>(_onLetterKeyPressed);
    on<BackspacePressed>(_onBackspacePressed);
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
    if(guesses.isNotEmpty) {
      guesses = guesses.substring(0, guesses.length - 1);
    }

    emit(state.copyWith(
      fullGuess: guesses
    ));
  }
}