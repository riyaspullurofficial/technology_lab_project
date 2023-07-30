

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle textStyleGreySignInterFont() {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          color: textFieldHint, fontSize: 12, fontWeight: FontWeight.w500));
}

TextStyle textStyleBlackSignInterFont() {
  return GoogleFonts.inter(
      textStyle: const TextStyle(
          color: black, fontSize: 12, fontWeight: FontWeight.w500));
}


