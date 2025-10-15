import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavigationPage({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 70,
          width: 230,
          decoration: BoxDecoration(
            color: const Color(0xFFFFC3DD),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFC3DD).withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                index: 0,
                isSelected: currentIndex == 0,
                selectedIcon: 'assets/images/game_selected.svg',
                unselectedIcon: 'assets/images/games.svg',
                onTap: () => onTap(0),
              ),
              _buildNavItem(
                index: 1,
                isSelected: currentIndex == 1,
                selectedIcon: 'assets/images/heart_selected.svg',
                unselectedIcon: 'assets/images/heart.svg',
                onTap: () => onTap(1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required bool isSelected,
    required String selectedIcon,
    required String unselectedIcon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: SvgPicture.asset(
          isSelected ? selectedIcon : unselectedIcon,
          width: 28,
          height: 28,
        ),
      ),
    );
  }
}
