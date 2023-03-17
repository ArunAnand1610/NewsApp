// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

var learning = GoogleFonts.rubik(
    fontSize: 26,
    letterSpacing: 0.52,
    fontWeight: FontWeight.w900,
    color: Color(0xff222222));

var H1 = GoogleFonts.rubik(
    fontSize: 14,
    letterSpacing: 1.43,
    fontWeight: FontWeight.w300,
    color: Color(0xff555555));

var next = GoogleFonts.rubik(
    shadows: [Shadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: 6)],
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0xffffffff));

var loginbut = GoogleFonts.rubik(
    shadows: [Shadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: 6)],
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xffffffff));

// -------------------------------------------
var gradientcolorbox = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(9, 206, 231, 0.3), Color.fromRGBO(3, 42, 181, 0.1)],
));

var logo_cont = EdgeInsets.only(top: 170);

var learn_cont = EdgeInsets.only(top: 24);

var H1_contmargin = EdgeInsets.only(top: 12, left: 16, right: 16);

var containernext = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(31, 84, 195, 0.15),
        blurRadius: 20.0,
      ),
    ],
    borderRadius: BorderRadius.circular(5),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      tileMode: TileMode.clamp,
      end: Alignment.bottomRight,
      colors: [Color(0xff007ebc), Color(0xff00c09d)],
    ));
var indication1 = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Color(0xff0088b7),
);
var indication2 = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Color(0xff0088b7),
);
var inidication3 = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Color(0xff88d7f2),
);
