import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_list_cubit/ui/app_styles.dart';

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
            color: AppStyles.primary1,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                index: 0,
                isSelected: currentIndex == 0,
                selectedIcon: 'assets/images/game_selected.svg',
                unselectedIcon: 'assets/images/game_unselected.svg',
                onTap: () => onTap(0),
              ),
              _buildNavItem(
                index: 1,
                isSelected: currentIndex == 1,
                selectedIcon: 'assets/images/heart_selected.svg',
                unselectedIcon: 'assets/images/heart_unselected.svg',
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
        padding: const EdgeInsets.all(AppStyles.paddingXL),
        child: SvgPicture.asset(isSelected ? selectedIcon : unselectedIcon),
      ),
    );
  }
}
