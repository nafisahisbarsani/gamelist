import 'package:game_list_cubit/features/games/cubit/games_cubit.dart';
import 'package:get_it/get_it.dart';

import '../repository/game_repository.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setUpLocator() async {
  await _setupRepositories();
  await _setupCubits();
}

Future<void> _setupRepositories() async {
  serviceLocator.registerFactory<GameRepository>(
        () => GameRepository(),
  );
}

Future<void> _setupCubits() async {
  // Game Cubit
  serviceLocator.registerFactory<GameCubit>(
        () => GameCubit(
      serviceLocator.get<GameRepository>(),
    ),
  );
}