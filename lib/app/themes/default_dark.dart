import 'package:flutter/material.dart';

const textColor = Color(0xFFf7faf5);
const backgroundColor = Color(0xFF020302);
const primaryColor = Color(0xFF92e3fc);
const primaryFgColor = Color(0xFF020302);
const secondaryColor = Color(0xFFef6e57);
const secondaryFgColor = Color(0xFF020302);
const accentColor = Color(0xFF85a52c);
const accentFgColor = Color(0xFF020302);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
