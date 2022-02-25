import 'package:flutter/material.dart';
import 'package:my_restaurant_app/authentication/login/widgets/login_view_body.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
