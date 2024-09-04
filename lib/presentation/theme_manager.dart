import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/color_manager.dart';
import 'package:flutter_application_1/presentation/font_manager.dart';
import 'package:flutter_application_1/presentation/style_manager.dart';
import 'package:flutter_application_1/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  final ThemeData theme = ThemeData();
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.primaryOpacity70,

    disabledColor: ColorManager.grey1,
    // old accent color
    colorScheme: theme.colorScheme.copyWith(secondary: ColorManager.grey),
    splashColor: ColorManager.primaryOpacity70, // will be used incase of disabled button for example

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    // button theme


  );
}
