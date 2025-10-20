import 'package:equatable/equatable.dart';
import '../../../model/game_model.dart';

abstract class GameListState extends Equatable {
  const GameListState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameListState {}

class GameLoading extends GameListState {}

class GameSuccess extends GameListState {
  final List<GameModel> games;

  const GameSuccess(this.games);

  @override
  List<Object> get props => [games];
}

class GameError extends GameListState {
  final String message;

  const GameError(this.message);

  @override
  List<Object> get props => [message];
}
class GameNavigate extends GameListState {
  final GameModel game;

  const GameNavigate(this.game);

  @override
  List<Object> get props => [game];
}
