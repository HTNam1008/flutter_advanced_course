import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,

    disabledColor: ColorManager.grey1,
    splashColor:
        ColorManager.grey, // will be used incase of disabled button for example

    // card view theme

    // app bar theme

    // button theme
  );
}
