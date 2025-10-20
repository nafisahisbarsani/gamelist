import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list_cubit/repository/favorite_repository.dart';
import 'package:game_list_cubit/repository/game_repository.dart';
import 'config/service_locator.dart';
import 'features/favorites/cubit/favorites_cubit.dart';
import 'features/games/cubit/game_list_cubit.dart';
import 'features/navigation/home_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAWG Games',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GameListCubit(serviceLocator<GameRepository>())),
          BlocProvider(create: (_) => FavoriteCubit(FavoriteRepository())),
        ],
        child: const HomeNavigation(),
      ),
    );
  }
}
