import 'package:flutter/material.dart';
import 'app_styles.dart';

class CustomArrow extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final Color iconColor;
  final Color boxColor;
  final Color textColor;

  const CustomArrow({
    Key? key,
    this.title,
    this.onBack,
    this.iconColor = AppStyles.black500,
    this.boxColor = AppStyles.primary1,
    this.textColor = AppStyles.primary1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppStyles.paddingXL, top: 35),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.10,
            width: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(AppStyles.radiusL),
            ),
            child: IconButton(
              onPressed: onBack ?? () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: iconColor,
                size: AppStyles.iconM,
              ),
            ),
          ),
          if (title != null) ...[
            SizedBox(width: AppStyles.spaceS),
            Text(title!, style: AppStyles.mlbold(color: AppStyles.primary1)),
          ],
        ],
      ),
    );
  }
}