import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list_cubit/repository/game_repository.dart';
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

  void searchGames(String query) async {
    if (query.isEmpty) {
      loadGames(); // TANPA AWAIT
      return;
    }

    emit(GameLoading());
    try {
      final response = await _repository.searchGames(query);
      emit(GameSuccess(response.results));
    } catch (e) {
      emit(GameError('Failed to search games: $e'));
    }
  }

  void refreshGames() async {
    final currentState = state;
    if (currentState is GameSuccess) {
      emit(GameLoading());
    }
    loadGames();
  }
}