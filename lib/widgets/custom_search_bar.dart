import 'package:flutter/material.dart';
import 'app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final String hintText;
  final double width;
  final double height;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    this.hintText = 'Search',
    this.width = 352,
    this.height = 51,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppStyles.black500,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: AppStyles.primary1),
          borderRadius: BorderRadius.circular(AppStyles.radiusXXXL),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                style: AppStyles.smedium(color: AppStyles.black00),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyles.smedium(color: AppStyles.black00),
                  border: InputBorder.none,
                  isDense: true,
                ),
                onChanged: onChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: AppStyles.primary1, size: AppStyles.iconL),
          ),
        ],
      ),
    );
  }
}
