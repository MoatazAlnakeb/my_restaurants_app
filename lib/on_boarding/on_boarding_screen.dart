import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant_app/authentication/login/login_screen.dart';
import 'package:my_restaurant_app/authentication/register/register_screen.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/shop_layout.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/on_boarding/widgets/page_view_item.dart';
import 'package:my_restaurant_app/shared/widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = 'OnBoardingScreen';
  const OnBoardingScreen() : super();

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   PageController pageController = new PageController();
   Timer ?_timer;
   int _currentPage = 0;
   @override
  void initState() {
    pageController = PageController(initialPage: 0)..addListener(() {
      setState(() {

      });
    });
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
   @override
   void dispose() {
     super.dispose();
     _timer?.cancel();
   }

   @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: General.kMainColor,
      appBar: AppBar(
        actions: [IconButton(
            icon: Icon(Icons.brightness_4_outlined),
            onPressed: (){
              AppCubit.get(context).changeAppTheme();
            })],
      ),
      body:Stack(
        children: [
          // General.sizeBoxVerical(height*.05),
          Positioned(
            top: height*.05,
            child: Container(
              height: height*.75,
              width: width,
              color: General.kMainColor,
              child: PageView(
                controller: pageController,
                children: [
                PageViewItem(
                  image: "assets/images/onboard_1.png" ,
                  title: "Search for favorite food near you",
                  subtitle: "Discover the foods from over 3250 restaurants.",
                  dotIndex:pageController.hasClients? pageController.page:0,
                ),
                PageViewItem(
                  image: "assets/images/onboard_2.png" ,
                  title: "Fast delivery to your place",
                  subtitle: "Fast delivery to your layout.home, office and wherever you are.",
                  dotIndex:pageController.hasClients? pageController.page:0,
                ),
                PageViewItem(
                  image: "assets/images/onboard_3.png" ,
                  title: "Tracking shipper on the map",
                  subtitle: "Discover the foods from over 3250 restaurants.",
                  dotIndex:pageController.hasClients? pageController.page:0,
                ),
              ],

              ),
            ),
          ),
    Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0)),
                color: General.kSecondaryColor,
              ),
              width: width,
              height: height*.25,
              // color: General.kSecondaryColor,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  CustomGeneralButton(text:"Sign Up",borderColor: General.kMainColor,width: width*.3,
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },),
                  CustomGeneralButton(text:"Sign In",backgroungColor: General.kMainColor,width: width*.3,
                    onTap:(){
                      submit();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                    }),
                ],
              )
            ),
          ),
        ],
      )
    );
  }

 void submit(){
     CashHelper.saveData(
         key: 'onBoarding'
         , value: true).then((value) {
           if(value){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));

           }
     });
 }
  
}
