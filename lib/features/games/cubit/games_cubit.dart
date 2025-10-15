import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/game_repository.dart';
import 'games_state.dart';


class GameCubit extends Cubit<GameState> {
  final GameRepository _repository;

  GameCubit(this._repository) : super(GameInitial());

  void loadGames() async {
    emit(GameLoading());
    try {
      final response = await _repository.getGames();
      emit(GameSuccess(response.results));
    } catch (e) {
      emit(GameError('Failed to load games: $e'));
    }
  }
}