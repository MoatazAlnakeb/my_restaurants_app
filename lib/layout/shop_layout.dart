import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/layout/notification/notification_screen.dart';
import 'package:my_restaurant_app/layout/search/search_screen.dart';

class ShopLayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(icon: Icon(Icons.notifications_none_outlined),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
                  }),
              IconButton(icon: Icon(Icons.search),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
                  })
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottomNavBarIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps_outlined),label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
