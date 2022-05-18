import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';
import 'package:flutter_test_project/shared/constants/imageAssets.dart';
import 'package:flutter_test_project/modules/homeScreen/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // region init State
  @override
  // ignore: missing_return
 initState(){
    // TODO: implement initState
    super.initState();
    goToNext();
  }
  // endregion

  // region build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // region Image
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                ImageAssets.logo,
                width: 150.0,
                height: 150.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // endregion
        ],
      ),
    );
  }
  // endregion

  Future<void> goToNext() async {
    Timer(const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())));
  }
}
