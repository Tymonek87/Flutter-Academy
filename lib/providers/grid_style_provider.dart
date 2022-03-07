import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/lists/image_list.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';

class GridStyleProvider extends ChangeNotifier {
  bool isFirstTime = true;
  void gridChange() {
    final random = math.Random();
    isFirstTime = false;
    spacing = spacingList[random.nextInt(spacingList.length)].toDouble();
    randomCardColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    hobbyFoto = imageList[random.nextInt(imageList.length)].toString();
    nameStyle = randomFont[random.nextInt(randomFont.length)];
    randomBackgroundGridColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }

  double spacing = 4;
  var randomCardColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  var hobbyFoto = imageList[random.nextInt(imageList.length)].toString();
  var nameStyle = randomFont[random.nextInt(randomFont.length)];
  var randomBackgroundGridColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
