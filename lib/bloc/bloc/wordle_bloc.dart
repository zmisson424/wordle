import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {

  WordleBloc() : super( const WordleState()) {
    on<LetterKeyPressed>(_onLetterKeyPressed);
  }

  Future<void> _onLetterKeyPressed(LetterKeyPressed event, Emitter<WordleState> emit) async {

    emit(state.copyWith(
      fullGuess: state.fullGuess + event.letter,
    ));
  }
}