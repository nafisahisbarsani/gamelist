import 'package:equatable/equatable.dart';
import '../../../../model/response/game_detail_response.dart';

abstract class GameDetailState extends Equatable {
  const GameDetailState();

  @override
  List<Object?> get props => [];
}

class GameDetailInitial extends GameDetailState {}

class GameDetailLoading extends GameDetailState {}

class GameDetailSuccess extends GameDetailState {
  final GameDetailResponse gameDetail;

  const GameDetailSuccess(this.gameDetail);

  @override
  List<Object?> get props => [gameDetail];
}

class GameDetailError extends GameDetailState {
  final String message;

  const GameDetailError(this.message);

  @override
  List<Object?> get props => [message];
}