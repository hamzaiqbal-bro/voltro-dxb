import 'package:flutter/material.dart';
import 'package:flutter_test_project/shared/constants/app_theme.dart';
import 'modules/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}


