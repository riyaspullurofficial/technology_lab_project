

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

InputDecoration textFieldDecoration({required String labelText}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: GoogleFonts.inter(
        textStyle: const TextStyle(fontSize: 14, color: black)),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(width: 1, color: black), //<-- SEE HERE
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(width: 1, color: black), //<-- SEE HERE
    ),

  );
}
