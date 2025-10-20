import '../data/db_helper.dart';
import '../model/game_model.dart';

class FavoriteRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<List<GameModel>> getFavorites() async {
    final maps = await dbHelper.getAllFavorites();

    return maps.map((m) {
      return GameModel(
        id: m['id'] is int ? m['id'] : int.tryParse(m['id'].toString()) ?? 0,
        name: m['name'] ?? '',
        backgroundImage: m['background_image'] ?? '',
        released: m['released'] ?? '',
        rating: (m['rating'] ?? 0) is num
            ? (m['rating'] as num).toDouble()
            : double.tryParse(m['rating'].toString()) ?? 0.0,
        description: null,
      );
    }).toList();
  }

  Future<void> addFavorite(GameModel game) async {
    await dbHelper.addFavorite({
      'id': game.id,
      'name': game.name,
      'background_image': game.backgroundImage ?? '',
      'released': game.released ?? '',
      'rating': game.rating,
      'addedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeFavorite(int id) async {
    await dbHelper.removeFavorite(id);
  }

  Future<bool> isFavorite(int id) async {
    return await dbHelper.isFavorite(id);
  }
}
