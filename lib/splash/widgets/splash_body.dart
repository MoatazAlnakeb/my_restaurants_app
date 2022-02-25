import 'package:flutter/material.dart';
import 'package:my_restaurant_app/authentication/login/login_screen.dart';
import 'package:my_restaurant_app/layout/shop_layout.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/on_boarding/on_boarding_screen.dart';

class SplashViewBody extends StatefulWidget {
  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    goToNextView();
    super.initState();
  }
  // final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: Image.asset('assets/images/base_logo.png'),
    ),);
  }

  void goToNextView() {

     Widget startWidget;
    bool onBoarding = CashHelper.getData(key: 'onBoarding');
    String token = CashHelper.getData(key: 'token');
    if(onBoarding != null){
      if(token!=null)startWidget = ShopLayOutScreen();
      else startWidget = LoginScreen();
    }else
      startWidget = OnBoardingScreen();
    print("onBoarding from splash is =$onBoarding");
    print("token from splash is =$token");
    Future.delayed(Duration(seconds: 3),(){
      //if you want to show ShopLayOutScreen if the user logged in un comment part below
      // if(onBoarding==true)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => startWidget));
      // else
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      //
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingScreen()));

    });
  }
}
