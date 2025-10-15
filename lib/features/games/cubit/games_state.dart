import 'package:equatable/equatable.dart';
import '../../../model/game_model.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameSuccess extends GameState {
  final List<GameModel> games;

  const GameSuccess(this.games);

  @override
  List<Object> get props => [games];
}

class GameError extends GameState {
  final String message;

  const GameError(this.message);

  @override
  List<Object> get props => [message];
}