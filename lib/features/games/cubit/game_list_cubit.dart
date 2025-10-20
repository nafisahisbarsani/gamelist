import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list_cubit/repository/game_repository.dart';
import '../../../model/game_model.dart';
import 'game_list_state.dart';

class GameListCubit extends Cubit<GameListState> {
  final GameRepository _repository;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasReachedEnd = false;
  String _currentQuery = '';

  GameListCubit(this._repository) : super(GameInitial());

  void loadGames() async {
    _currentPage = 1;
    _hasReachedEnd = false;
    _currentQuery = '';
    emit(GameLoading());

    try {
      final response = await _repository.getGames(page: _currentPage);
      emit(GameSuccess(response.results));
    } catch (e) {
      emit(GameError('Failed to load games: $e'));
    }
  }

  void searchGames(String query) async {
    _currentPage = 1;
    _hasReachedEnd = false;
    _currentQuery = query;

    emit(GameLoading());
    try {
      final response =
      await _repository.searchGames(query, page: _currentPage);
      emit(GameSuccess(response.results));
    } catch (e) {
      emit(GameError('Failed to search games: $e'));
    }
  }

  Future<void> loadMoreGames() async {
    if (_isLoadingMore || _hasReachedEnd) return;
    if (state is! GameSuccess) return;

    _isLoadingMore = true;
    _currentPage++;

    try {
      final response = _currentQuery.isEmpty
          ? await _repository.getGames(page: _currentPage)
          : await _repository.searchGames(_currentQuery, page: _currentPage);

      if (response.results.isEmpty) {
        _hasReachedEnd = true;
      } else {
        final currentGames = (state as GameSuccess).games;
        emit(GameSuccess([...currentGames, ...response.results]));
      }
    } catch (e) {
      emit(GameError('Failed to load more games: $e'));
    } finally {
      _isLoadingMore = false;
    }
  }
  void openGameDetail(GameModel game) {
    emit(GameNavigate(game));
  }

}