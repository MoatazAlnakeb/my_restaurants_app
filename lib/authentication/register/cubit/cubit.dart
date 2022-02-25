import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/authentication/login/cubit/states.dart';
import 'package:my_restaurant_app/authentication/models/login_model.dart';
import 'package:my_restaurant_app/authentication/register/cubit/states.dart';
import 'package:my_restaurant_app/network/end_points.dart';
import 'package:my_restaurant_app/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel loginModel;
  void userRegister({
  @required String name,
  @required String phone,
  @required String email,
  @required String password,
})
  {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'name':name,
          'phone':phone,
          'email':email,
          'password':password
        }).then((value) {
          //لما يكون ال statuscod=200 لكن في ايرور داخل ال response اللي راجع ف ال body
          print(value.data);
          loginModel = ShopLoginModel.fromJson(value.data);
          emit(ShopRegisterSuccessState(loginModel));
    }).catchError((error){
      //لما يكون الايرور من برة اصلا مش ف ال body يعني ال status code لا يساوي 200
      emit(ShopRegisterErrorState(error.toString()));
  });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined ;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}