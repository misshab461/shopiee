import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.grey.shade300,
  ),
  hintColor: Colors.grey.shade800,
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey.shade300,
  ),
  primaryColor: Colors.grey.shade400,
  cardColor: Colors.grey.shade50,
  scaffoldBackgroundColor: Colors.grey.shade300,
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: GoogleFonts.roboto().fontFamily,
    ),
  ),
  iconTheme: const IconThemeData(
    size: 25,
    color: Colors.black,
  ),
);
