import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/bloc/event/wordle_event.dart';
import 'package:wordle/bloc/state/wordle_state.dart';
import 'package:wordle/data/stats_repository.dart';
import '../../api/dictionary.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {

  WordleBloc() : super( const WordleState()) {
    on<CreateNewGame>(_onNewGame);
    on<GameLoading>(_onGameLoading);
    on<LetterKeyPressed>(_onLetterKeyPressed);
    on<BackspacePressed>(_onBackspacePressed);
    on<SubmitPressed>(_onSubmitPressed);
    on<GameOver>(_onGameOver);
    on<StartStopwatch>(_startStopwatch);
    on<SetStopwatch>(_setStopwatch);
    on<StopStopwatch>(_stopStopwatch);
  }

  final StatsRepository _statsRepository = StatsRepository();
  final Stopwatch stopwatch = Stopwatch();
  Stream<int>? stopwatchStream;

  Future<void> _onNewGame(CreateNewGame event, Emitter<WordleState> emit) async {
    add(GameLoading());

    String? newAnswer = await getRandomWord();

    int totalGames = await _statsRepository.fetchStat(StatsRepository.kTotalGames) ?? 0;
    _statsRepository.writeStat(StatsRepository.kTotalGames, totalGames + 1);

    emit(state.copyWith(
      answer: newAnswer?.toUpperCase() ?? 'broke',
      gameState: GameState.playing
    ));
  }

  Future<void> _onGameLoading(GameLoading event, Emitter<WordleState> emit) async {
    emit(state.copyWith(
      fullGuess: '',
      currentGuess: 1,
      guessAccuracy: const [],
      letterHits: const {},
      gameState: GameState.loading,
      timer: "00:00"
    ));
  }

  Future<void> _onLetterKeyPressed(LetterKeyPressed event, Emitter<WordleState> emit) async {

    if(!stopwatch.isRunning){
      add(StartStopwatch());
    }

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

      String currentGuess = state.fullGuess.substring(maxLength - 5, maxLength).toUpperCase();
      List<GuessAccuracy> accuracy = [...state.guessAccuracy];
      Map<String, GuessAccuracy> keyGuess = {...state.letterHits};

      // Compare Letters
      for(int i = 0; i < 5; i++){
        if(currentGuess[i].toUpperCase() == state.answer[i].toUpperCase()){
          accuracy.add(GuessAccuracy.correct);

          if(!keyGuess.containsKey(currentGuess[i])){
            keyGuess[currentGuess[i]] = GuessAccuracy.correct;
          }
        }
        else if(state.answer.contains(currentGuess[i])){
          accuracy.add(GuessAccuracy.close);
          if(!keyGuess.containsKey(currentGuess[i])){
            keyGuess[currentGuess[i]] = GuessAccuracy.close;
          }
        }
        else {
          accuracy.add(GuessAccuracy.miss);
          if(!keyGuess.containsKey(currentGuess[i])){
            keyGuess[currentGuess[i]] = GuessAccuracy.miss;
          }
        }
      }

      emit(state.copyWith(
        currentGuess: state.currentGuess + 1,
        guessAccuracy: accuracy,
        letterHits: keyGuess
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
    add(StopStopwatch());
    if(event.gameWon){

      // Update Game won counter
      int gamesWon = await _statsRepository.fetchStat(StatsRepository.kGamesWon) ?? 0;
      _statsRepository.writeStat(StatsRepository.kGamesWon, gamesWon + 1);

      int currentStreak = await  _statsRepository.fetchStat(StatsRepository.kCurrentStreak) ?? 0;
      int bestStreak = await _statsRepository.fetchStat(StatsRepository.kBestStreak) ?? 0;

      if(currentStreak + 1 > bestStreak){
        _statsRepository.writeStat(StatsRepository.kBestStreak, currentStreak + 1);
      }
      _statsRepository.writeStat(StatsRepository.kCurrentStreak, currentStreak + 1);

      switch(state.currentGuess){
        case 0:
          int guessAttempts = await  _statsRepository.fetchStat(StatsRepository.kOneGameWins) ?? 0;
          _statsRepository.writeStat(StatsRepository.kOneGameWins, guessAttempts + 1);
          break;
        case 1:
          int guessAttempts = await  _statsRepository.fetchStat(StatsRepository.kTwoGameWins) ?? 0;
          _statsRepository.writeStat(StatsRepository.kTwoGameWins, guessAttempts + 1);
          break;
        case 2:
          int guessAttempts = await  _statsRepository.fetchStat(StatsRepository.kThreeGameWins) ?? 0;
          _statsRepository.writeStat(StatsRepository.kThreeGameWins, guessAttempts + 1);
          break;
        case 3:
          int guessAttempts = await  _statsRepository.fetchStat(StatsRepository.kFourGameWins) ?? 0;
          _statsRepository.writeStat(StatsRepository.kFourGameWins, guessAttempts + 1);
          break;
        case 4:
          int guessAttempts = await  _statsRepository.fetchStat(StatsRepository.kFiveGameWins) ?? 0;
          _statsRepository.writeStat(StatsRepository.kFiveGameWins, guessAttempts + 1);
          break;
      }

      emit(state.copyWith(
        gameState: GameState.won
      ));
    }
    else{
      _statsRepository.writeStat(StatsRepository.kCurrentStreak, 0);
      emit(state.copyWith(
        gameState: GameState.lost
      ));
    }
  }

  Future<void> _startStopwatch(StartStopwatch event, Emitter<WordleState> emit) async {
    stopwatch.reset();

    stopwatch.start();
    stopwatchStream = Stream.periodic(const Duration(seconds: 1), (x) {
      return x;
    });
    stopwatchStream?.listen((event) {
      add(SetStopwatch());
    });
  }

  Future<void> _setStopwatch(SetStopwatch event, Emitter<WordleState> emit) async {
    String result = '';

    int hours = stopwatch.elapsed.inHours;
    int minutes = stopwatch.elapsed.inMinutes.remainder(60);
    int seconds = stopwatch.elapsed.inSeconds.remainder(60);
    if(hours > 9){
      result = hours.toString();
    }
    else if(hours > 0){
      result = "0$hours:";
    }

    if(minutes > 0){
      result = result + minutes.toString();
    }
    else{
      result = "${result}00";
    }

    if(seconds > 9){
      result = "$result:$seconds";
    }
    else if(seconds > 0){
      result = "$result:0$seconds";
    }
    else{
      result = "$result:00";
    }

    emit(state.copyWith(
      timer: result
    ));
  }

  Future<void> _stopStopwatch(StopStopwatch event, Emitter<WordleState> emit) async {
    stopwatch.stop();
    stopwatchStream = null;
  }
}