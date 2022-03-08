import 'package:flutter/material.dart';
import 'package:my_restaurant_app/authentication/login/login_screen.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';

void signOut(context){
  CashHelper.removeData(key: 'token').then((value) {
    if(value)
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  });
}
void printFullText(String text){
  final pattern = RegExp('.{1,800}');//800 is the size of each chunk
  pattern.allMatches(text).forEach((match) {print(match.group(0)); });
}

String? token = '';