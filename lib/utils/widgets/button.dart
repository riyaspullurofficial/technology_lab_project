

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/colors.dart';

Widget loginButton({required String buttonText}){

  return  Container(
    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
    decoration: BoxDecoration(
        color: button_color,
        borderRadius: BorderRadius.circular(15)),
    child: Text(
      buttonText,
      textAlign: TextAlign.center,
      style: GoogleFonts.publicSans(
          textStyle: const TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w800,
              fontSize: 18)),
    ),
  );
}