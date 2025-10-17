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
    this.iconColor = AppStyles.black00,
    this.boxColor = AppStyles.primary1,
    this.textColor = AppStyles.primary1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppStyles.paddingXL,
        top: AppStyles.paddingXXL,
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.10,
            width: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(AppStyles.radiusS),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: iconColor,
                size: AppStyles.iconS,
              ),
            ),
          ),
          if (title != null) ...[
            SizedBox(width: AppStyles.spaceS),
            Text(
              title!,
              style: AppStyles.lgsemibold(color: AppStyles.primary1),
            ),
          ],
        ],
      ),
    );
  }
}
