 // ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

// Define primary color
const Color primaryClr = Colors.blue;
const Color yellowClr = Color(0xFF4e5ae8);
const Color pinkClr = Color(0xFFFFB746);
const Color white = Colors.white;
Color darkHeaderClr = Color(0xFF424242);

// Define dark grey color
const Color darkGreyClr = Colors.grey;

class Themes{
  static final light= ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );

static final dark= ThemeData(
  backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
   textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color:Get.isDarkMode?Colors.grey[400]:Colors.grey
   )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato (
   textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color:Get.isDarkMode?Colors.white:Colors.black
   )
  );
}