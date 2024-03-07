import 'package:felicitup/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        fontFamily: FontFamily.inter,
        useMaterial3: true,
        scaffoldBackgroundColor: isDarkmode ? Colors.black : Colors.white,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
      );
}
