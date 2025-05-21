import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/assets/gen/fonts.gen.dart';

class TextStyles {
  static const TextStyle chip = TextStyle(
    fontSize: 13,
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w500,
    height: 16 / 13,
    letterSpacing: 0.5,
    color: ColorName.surfaceColorsOnSurface,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w500,
    height: 20 / 18,
    letterSpacing: 0.15,
    color: ColorName.surfaceColorsOnSurface,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: ColorName.surfaceColorsOnSurface,
  );

  static const TextStyle link = TextStyle(
    fontSize: 11,
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.underline,
    letterSpacing: 0,
    color: ColorName.surfaceColorsOnSurface,
  );

  static const TextStyle navItem = TextStyle(
    fontSize: 10,
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: ColorName.surfaceColorsOnSurface,
  );
}
