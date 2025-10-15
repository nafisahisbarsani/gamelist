import 'package:flutter/material.dart';

class AppStyles {
  //Primary Colors
  static const Color primary1 = Color(0xFFFFC3DD);
  static const Color primary1_45 = Color(0x73FFC3DD); //45 opacity

  //Black Shades
  static const Color black500 = Color(0xFF000000);
  static const Color black400 = Color(0xFF797979);
  static const Color black300 = Color(0xFFBCBCBC);
  static const Color black200 = Color(0xFFE8E8E8);
  static const Color black100 = Color(0xFFF3F3F3);
  static const Color black00 = Color(0xFFFFFFFF);

  //padding & margin
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 10.0;
  static const double paddingL = 16.0;
  static const double paddingXL = 20.0;
  static const double paddingXXL = 30.0;

  //Border Radius
  static const double radiusXXS = 2.0;
  static const double radiusXS = 4.0;
  static const double radiusS = 6.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusXXL = 18.0;
  static const double radiusXXXL = 20.0;

  //Spacing
  static const double spaceXXS = 2.0;
  static const double spaceXS = 4.0;
  static const double spaceS = 6.0;
  static const double spaceM = 8.0;
  static const double spaceL = 10.0;
  static const double spaceXL = 12.0;
  static const double spaceXXL = 14.0;
  static const double spaceXXXL = 16.0;
  static const double spaceXXXXL = 20.0;

  //Icon Sizes
  static const double iconS = 10.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXL = 30.0;
  static const double iconXXL = 35.0;

  //Text
  static TextStyle mlregular({required Color color}) => TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    color: color,
  );
  static TextStyle mlmedium({required Color color}) => TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle mlsemibold({required Color color}) => TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle mlbold({required Color color}) => TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle lgregular({required Color color}) => TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    color: color,
  );
  static TextStyle lgmedium({required Color color}) => TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle lgsemibold({required Color color}) => TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle lgbold({required Color color}) => TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle sregular({required Color color}) => TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    color: color,
  );
  static TextStyle smedium({required Color color}) => TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle ssemibold({required Color color}) => TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle sbold({required Color color}) => TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle xsregular({required Color color}) => TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    color: color,
  );
  static TextStyle xsmedium({required Color color}) => TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle xssemibold({required Color color}) => TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle xsbold({required Color color}) => TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: color,
  );
}
