import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list_cubit/repository/game_repository.dart';
import '../../../model/game_model.dart';
import 'games_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _repository;

  int _currentPage = 1;
  final int _pageSize = 10;
  List<GameModel> _allGames = [];     // full list or search result
  List<GameModel> _filteredGames = []; // filtered list after search

  GameCubit(this._repository) : super(GameInitial());

  Future<void> loadGames() async {
    emit(GameLoading());
    try {
      final response = await _repository.getGames();
      _allGames = response.results;
      _filteredGames = _allGames; // initially all games
      _currentPage = 1;
      emit(GameSuccess(_getCurrentPageGames()));
    } catch (e) {
      emit(GameError('Failed to load games: $e'));
    }
  }

  List<GameModel> _getCurrentPageGames() {
    final startIndex = (_currentPage - 1) * _pageSize;
    final endIndex = (_currentPage * _pageSize).clamp(0, _filteredGames.length);
    return _filteredGames.sublist(startIndex, endIndex);
  }

  void nextPage() {
    if (_currentPage * _pageSize >= _filteredGames.length) return;
    _currentPage++;
    emit(GameSuccess(_getCurrentPageGames()));
  }

  void prevPage() {
    if (_currentPage == 1) return;
    _currentPage--;
    emit(GameSuccess(_getCurrentPageGames()));
  }

  void searchGames(String query) {
    if (query.isEmpty) {
      _filteredGames = _allGames;
    } else {
      _filteredGames = _allGames
          .where((g) => g.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    _currentPage = 1;
    emit(GameSuccess(_getCurrentPageGames()));
  }
}
