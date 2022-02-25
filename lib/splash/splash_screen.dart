import 'package:flutter/material.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/splash/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  static String id = 'SplashView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: General.kMainColor,
      body: SplashViewBody(),
    );
  }
}
