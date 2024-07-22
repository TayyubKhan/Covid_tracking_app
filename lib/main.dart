import 'package:covidapp/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'darkmode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Dark_mode_Provider()),
      ],
        child: Builder(builder: (BuildContext context) {
          final themechanger = Provider.of<Dark_mode_Provider>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themechanger.thememode,
              darkTheme: ThemeData(
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal),
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.pink,
              ),
              home: const SplashScreen());
        }));
  }
}

