import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_detail_state.dart';
import '../../../../repository/game_repository.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  final GameRepository _repository;

  GameDetailCubit(this._repository) : super(GameDetailInitial());

  Future<void> fetchGameDetail(int id) async {
    try {
      emit(GameDetailLoading());
      final response = await _repository.getGameDetail(id);
      emit(GameDetailSuccess(response));
    } catch (e) {
      emit(GameDetailError(e.toString()));
    }
  }
}
