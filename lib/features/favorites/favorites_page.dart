import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_list_cubit/widgets/app_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.black500,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/heart.svg',
            ),
            SizedBox(width: AppStyles.spaceM),
            Text(
              'Favorite',
              style: AppStyles.lgsemibold(color: AppStyles.primary1),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(child: Text("Halaman Favorite", style: AppStyles.ssemibold(color: AppStyles.black00),),),
      ),
    );
  }
}
