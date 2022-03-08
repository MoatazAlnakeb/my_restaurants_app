/*import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:my_restaurant_app/authentication/login/cubit/cubit.dart';
import 'package:my_restaurant_app/bloc_observer.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/network/remote/dio_helper.dart';
import 'package:my_restaurant_app/shared/constants.dart';
import 'package:my_restaurant_app/shared/widgets/themes.dart';
import 'package:my_restaurant_app/splash/splash_screen.dart';

import 'general/general_constants.dart';
import 'general/general_constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  // var notification_token = await FirebaseMessaging.instance.getToken();
  // print("notification token is $notification_token");

  // FirebaseMessaging.onMessage.listen((event) {
  //   print("success receiving notification");
  // }).onError((error){
  //   print("error from receving notification $error");
  // });
  DioHelper.init();
  await CashHelper.init();
  bool ?isDark = CashHelper.getIsAppThemeDark(key: 'isDark');

  token = CashHelper.getData(key: 'token');
  // runApp(MyApp());
  BlocOverrides.runZoned(
        () {
      // Use blocs...
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
 bool? isDark;
  MyApp({this.isDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext )=>AppCubit()..changeAppTheme(fromShared: isDark!),),
        BlocProvider(create: (BuildContext )=>AppCubit()..getHomeData()..getCategories()..getFavourites()..getUserData()..getNotifications()),

        BlocProvider(create: (BuildContext )=>ShopLoginCubit()),
        ],
        child:BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: lightTheme,

              darkTheme: darkThemd,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
              home: SplashView(),
              // layout.home: OnBoardingScreen(),
            );
          },
        )
    );
    // return MultiBlocProvider(
    //   providers: [
    //
    //   ],
    //   child: BlocConsumer<AppCubit,AppStates>(
    //     listener: (context,state){},
    //     builder: (context,state){
    //       return MaterialApp(
    //         title: 'Flutter Demo',
    //         theme: ThemeData(
    //           primarySwatch: Colors.blue,
    //         ),
    //         layout.home: OnBoardingScreen(),
    //       );
    //     },
    //   ),
    // );
  }
}
*/
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:my_restaurant_app/authentication/login/cubit/cubit.dart';
import 'package:my_restaurant_app/bloc_observer.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/network/remote/dio_helper.dart';
import 'package:my_restaurant_app/shared/constants.dart';
import 'package:my_restaurant_app/shared/widgets/themes.dart';
import 'package:my_restaurant_app/splash/splash_screen.dart';

import 'general/general_constants.dart';
import 'general/general_constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //         channelKey: 'key1',
  //         channelName: 'Restaurnts App',
  //         channelDescription: "Do nice notifications",
  //       defaultColor: General.kSecondaryColor,
  //       ledColor: Colors.white,
  //       playSound: true,
  //       enableLights: true,
  //       enableVibration: true
  //     )
  //   ]
  // );

  // var notifications_token = await FirebaseMessaging.instance.getToken();
  // FirebaseMessaging.onMessage.listen((event) {
  //   print("success receiving notification");
  // }).onError((error){
  //   print("error from receving notification $error");
  // });

  DioHelper.init();
  await CashHelper.init();
  bool ?isDark = CashHelper.getIsAppThemeDark(key: 'isDark');

  token = CashHelper.getData(key: 'token');
  // runApp(MyApp());
  BlocOverrides.runZoned(
        () {
      // Use blocs...
      runApp(MyApp(
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({this.isDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext )=>AppCubit()..changeAppTheme(fromShared: isDark!),),
          BlocProvider(create: (BuildContext )=>AppCubit()..getHomeData()..getCategories()..getFavourites()..getUserData()..getNotifications()),

          BlocProvider(create: (BuildContext )=>ShopLoginCubit()),
        ],
        child:BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: lightTheme,

              darkTheme: darkThemd,
              themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
              home: SplashView(),
              // layout.home: OnBoardingScreen(),
            );
          },
        )
    );

  }
}
