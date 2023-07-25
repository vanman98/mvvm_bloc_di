import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize,FontWeight fontWeight, Color color) {
  return GoogleFonts.roboto(fontSize: fontSize,fontWeight: fontWeight,color: color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,FontWeightManager.regular,color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,FontWeightManager.bold, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,FontWeightManager.medium, color);
}










