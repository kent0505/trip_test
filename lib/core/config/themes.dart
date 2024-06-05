import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.blueGrey,
  fontFamily: 'SFProText',
  scaffoldBackgroundColor: AppColors.bg,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
  ),
);
