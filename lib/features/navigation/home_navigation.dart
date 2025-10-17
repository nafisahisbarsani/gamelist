import 'package:game_list_cubit/features/favorites/favorites_page.dart';
import '../games/games_list_page.dart';
import 'navigation_page.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [GameListPage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          NavigationPage(currentIndex: _currentIndex, onTap: _onTap),
        ],
      ),
    );
  }
}