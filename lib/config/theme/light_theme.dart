import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

ThemeData themeData = ThemeData(
  colorSchemeSeed: AppColors.white,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,

    centerTitle: true,
  ),
);
