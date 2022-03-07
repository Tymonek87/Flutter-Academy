import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:tomasz_krason_flutter_academy_task_zero/lists/image_list.dart';

class MyColors {
  static Color buttonColor = const Color(0xFF0C5E92);
}

final random = math.Random();
var nameStyle = randomFont[random.nextInt(randomFont.length)];
var randomCardColor =
    randomCardColorPalette[random.nextInt(randomCardColorPalette.length)];
var randomBackgroundGridColor =
    randomCardColorPalette[random.nextInt(randomCardColorPalette.length)];
var hobbyFoto = imageList[random.nextInt(imageList.length)].toString();

const List<Color> kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

const List<Color> randomCardColorPalette = [
  Colors.red,
  Colors.grey,
  Colors.black,
  Colors.brown,
  Colors.amber,
  Colors.teal,
  Colors.green,
  Colors.blue,
  Colors.indigo,
];

List<TextStyle> randomFont = [
  GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
  GoogleFonts.lobster(fontWeight: FontWeight.bold, color: Colors.white),
  GoogleFonts.pacifico(fontWeight: FontWeight.bold, color: Colors.white),
  GoogleFonts.secularOne(fontWeight: FontWeight.bold, color: Colors.white),
  GoogleFonts.paytoneOne(fontWeight: FontWeight.bold, color: Colors.white),
  GoogleFonts.kalam(fontWeight: FontWeight.bold, color: Colors.white),
];

double spacing = 4;
var spacingList = [4, 8, 12, 16];
var border = BorderRadius.circular(8);
