import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{

static late SharedPreferences sharedPreferences;

static init()async{
  sharedPreferences = await SharedPreferences.getInstance();
}

static Future<bool> putIsAppThemeDark({
  required String key,
  required bool value
})async{
  return await sharedPreferences.setBool(key, value);
}

static bool? getIsAppThemeDark({required String key}){
  return sharedPreferences.getBool(key);
}

static Future<bool> saveData({
  required String key,
  required dynamic value
})async{
  if(value is String) return await sharedPreferences.setString(key, value);
  if(value is int) return await sharedPreferences.setInt(key, value);
  if(value is bool) return await sharedPreferences.setBool(key, value);

  return await sharedPreferences.setDouble(key, value);
}

static dynamic getData(
    {required String key})
{
  if(key=="onBoarding"&&sharedPreferences.get(key)==null){

  }
  print("asd key from getData ${sharedPreferences.get(key)} ");
  return sharedPreferences.get(key);
}

static Future<bool> removeData({
  required String key,})async{
  return await sharedPreferences.remove(key);
}

}