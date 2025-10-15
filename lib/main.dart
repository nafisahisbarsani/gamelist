import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list_cubit/features/games/games_page.dart';
import 'package:game_list_cubit/repository/game_repository.dart';

import 'features/games/cubit/games_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAWG Games',
      home: BlocProvider(
        create: (_) => GameCubit(GameRepository()),
        child: const GamesPage(),
      ),
    );
  }
}