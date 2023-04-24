import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFeefff5),
      100: Color(0xFFd7ffea),
      200: Color(0xFFb2ffd7),
      300: Color(0xFF76ffb9),
      400: Color(0xFF33f593),
      500: Color(0xFF09de72),
      600: Color(_primaryValue),
      700: Color(0xFF04914b),
      800: Color(0xFF0a713e),
      900: Color(0xFF0a5d36),
      950: Color(0xFF00341c),
    },
  );
  static const int _primaryValue = 0xff00AB55;

  //! SECONDARY
  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      50: Color(0xffebf7ff),
      100: Color(0xffdbefff),
      200: Color(0xffbee1ff),
      300: Color(0xff97cbff),
      400: Color(0xff6ea8ff),
      500: Color(0xff4c87ff),
      600: Color(_secondaryValue),
      700: Color(0xff204ce2),
      800: Color(0xff1d43b6),
      900: Color(0xff203e8f),
      950: Color(0xff132353),
    },
  );
  static const int _secondaryValue = 0xff3366ff;

  //! INFO
  static const MaterialColor info = MaterialColor(
    _infoValue,
    <int, Color>{
      50: Color(0xffebfeff),
      100: Color(0xffcefbff),
      200: Color(0xffa2f4ff),
      300: Color(0xff63eafd),
      400: Color(0xff1cd6f4),
      500: Color(_infoValue),
      600: Color(0xff0393b7),
      700: Color(0xff0a7594),
      800: Color(0xff125e78),
      900: Color(0xff144e65),
      950: Color(0xff063446),
    },
  );
  static const int _infoValue = 0xff00b8d9;

  //! SUCCESS
  static const MaterialColor success = MaterialColor(
    _successValue,
    <int, Color>{
      50: Color(0xffedfcf4),
      100: Color(0xffd4f7e3),
      200: Color(0xffadedcc),
      300: Color(0xff78ddaf),
      400: Color(_successValue),
      500: Color(0xff1eab74),
      600: Color(0xff118a5d),
      700: Color(0xff0e6e4d),
      800: Color(0xff0d583f),
      900: Color(0xff0c4834),
      950: Color(0xff05291e),
    },
  );
  static const int _successValue = 0xff36b37e;

  //! WARNING
  static const MaterialColor warning = MaterialColor(
    _warningValue,
    <int, Color>{
      50: Color(0xfffffdea),
      100: Color(0xfffff6c5),
      200: Color(0xffffee85),
      300: Color(0xffffdf46),
      400: Color(0xffffcd1b),
      500: Color(_warningValue),
      600: Color(0xffe28200),
      700: Color(0xffbb5a02),
      800: Color(0xff984508),
      900: Color(0xff7c390b),
      950: Color(0xff481c00),
    },
  );
  static const int _warningValue = 0xffffab00;

  //! WARNING
  static const MaterialColor error = MaterialColor(
    _errorValue,
    <int, Color>{
      50: Color(0xfffff2ed),
      100: Color(0xffffe2d4),
      200: Color(0xffffc0a8),
      300: Color(0xffff9471),
      400: Color(_errorValue),
      500: Color(0xfffe3311),
      600: Color(0xffef1907),
      700: Color(0xffc60c08),
      800: Color(0xff9d0f11),
      900: Color(0xff7e1011),
      950: Color(0xff44060a),
    },
  );
  static const int _errorValue = 0xffFF5630;

  //! GRAY
  static const MaterialColor grey = MaterialColor(
    _greyValue,
    <int, Color>{
      100: Color(0xffF9FAFB),
      200: Color(0xffF4F6F8),
      300: Color(0xffDFE3E8),
      400: Color(0xffC4CDD5),
      500: Color(_greyValue),
      600: Color(0xff637381),
      700: Color(0xff454F5B),
      800: Color(0xff212B36),
      900: Color(0xff161C24),
    },
  );
  static const int _greyValue = 0xff919EAB;
}
