import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

// const Color white = Color(0xffffffff);
// const Color grey500 = Color(0xffF5F7F9);
// const Color grey100 = Color(0xffEFEFEF);
const Color orange300 = Color(0xffFF626F);
const Color pink500 = Color(0xffD421D7);
// const Color green400 = Color(0xff38E973);
// const Color orange100 = Color(0xffFF7175);

// final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor:
//         Color(formatColor(path: darkColors["background"]["body"])),
//     cardColor: Color(formatColor(path: darkColors["background"]["card"])),
//     iconTheme: const IconThemeData(
//       color: Colors.white70,
//     ),
//     primaryColor:
//         Color(formatColor(path: darkColors["allThentic"]["green"][800])),
//     primaryColorLight:
//         Color(formatColor(path: darkColors["allThentic"]["green"][800])),
//     textTheme: const TextTheme(
//       bodySmall: TextStyle(
//           fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white70),
//       bodyMedium: TextStyle(
//           fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
//       bodyLarge: TextStyle(
//           fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//       headlineSmall: TextStyle(
//           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//       headlineMedium: TextStyle(
//           fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//       headlineLarge: TextStyle(
//           fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
//     ));

final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: MyColors.grey[200],
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    primaryColor: MyColors.primary,
    cardColor: Colors.white,
    cardTheme: const CardTheme(color: Colors.white, elevation: 0),
    textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.light).textTheme));

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: MyColors.grey[900],
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    primaryColor: MyColors.primary,
    cardColor: MyColors.grey[800],
    cardTheme: CardTheme(color: MyColors.grey[800]!, elevation: 0),
    textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme));
