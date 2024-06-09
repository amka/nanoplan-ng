import 'package:flutter/material.dart';

const textColor = Color(0xFF070a05);
const backgroundColor = Color(0xFFfcfdfc);
const primaryColor = Color(0xFF03536c);
const primaryFgColor = Color(0xFFfcfdfc);
const secondaryColor = Color(0xFFa72610);
const secondaryFgColor = Color(0xFFfcfdfc);
const accentColor = Color(0xFFb3d35b);
const accentFgColor = Color(0xFF070a05);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
