import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/home_page.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/providers/theme_provider.dart';
import 'package:tomasz_krason_flutter_academy_task_zero/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => const MyHomePage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);

          return MaterialApp(
            themeMode: themeProvider.themeMode,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: routes,
          );
        });
  }
}
