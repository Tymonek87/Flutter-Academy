import 'package:flutter/material.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/styles/styles.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      const brightness = Brightness.dark;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      toggleableActiveColor: const Color.fromARGB(255, 53, 53, 53),
      colorScheme: const ColorScheme.dark(),
      appBarTheme: AppBarTheme(color: MyColors.buttonColor));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: AppBarTheme(color: MyColors.buttonColor));
}
