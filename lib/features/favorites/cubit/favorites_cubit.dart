import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/game_model.dart';
import '../../../repository/favorite_repository.dart';
import 'favorites_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repository;

  FavoriteCubit(this._repository) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await _repository.getFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError('Failed to load favorites: $e'));
    }
  }

  Future<void> toggleFavorite(GameModel game) async {
    try {
      final isFav = await _repository.isFavorite(game.id);
      if (isFav) {
        await _repository.removeFavorite(game.id);
      } else {
        await _repository.addFavorite(game);
      }
      loadFavorites();
    } catch (e) {
      emit(FavoriteError('Failed to update favorite: $e'));
    }
  }
}
