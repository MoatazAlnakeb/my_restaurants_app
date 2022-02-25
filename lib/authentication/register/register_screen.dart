import 'package:flutter/material.dart';
import 'package:my_restaurant_app/authentication/register/widgets/register_view_body.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildRegisterViewBody(),
    );
  }
}
