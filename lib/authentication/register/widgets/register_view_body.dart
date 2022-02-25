
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/authentication/login/cubit/cubit.dart';
import 'package:my_restaurant_app/authentication/register/cubit/cubit.dart';
import 'package:my_restaurant_app/authentication/register/cubit/states.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/shop_layout.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/shared/constants.dart';
import 'package:my_restaurant_app/shared/widgets/custom_button.dart';
import 'package:my_restaurant_app/shared/widgets/custom_test_field.dart';
import 'package:my_restaurant_app/shared/widgets/show_toast.dart';


class buildRegisterViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
  create: (context) => ShopRegisterCubit(),
  child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
    listener: (BuildContext context , ShopRegisterStates state){
      // listener: (context,state){
      if(state is ShopRegisterSuccessState){
        //الحالتين اللي تحت هو ف ال success state
        //بس حالة منهم ب true وهيدخل علي ال layout.home page
        //والحالة التانية ب false وهيفضل موجود ف ال login screen
        if(state.loginModel.status) {
          print(state.loginModel.message);
          print(state.loginModel.data.token);
          showToast(text: state.loginModel.message,
              state: ToastState.SUCCESS
          );
          CashHelper.saveData(
              key: 'token',
              value: state.loginModel.data.token
          ).then((value) {
            token = state.loginModel.data.token;
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ShopLayOutScreen()));
          });
        }else{
          print(state.loginModel.message);
          showToast(text: state.loginModel.message,
              state: ToastState.ERROR
          );

        }
      }
    },
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Account',
                      style: TextStyle(
                        fontFamily: 'SFProDisplay-Bold',
                        fontSize: 26,
                        color: const Color(0xff222b45),
                        height: 1.1538461538461537,
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),

                    General.sizeBoxVerical(height*.05),

                    defaultTextFormField(
                      controller: nameController,
                      keboardType: TextInputType.name,
                      validate: (String value){
                        if(value.isEmpty)
                          return "name must not to be empty";
                      },
                      label: "User Name",
                      prefix:  Icons.person,
                      prefixcolor: General.kSecondaryColor,
                    ),

                    General.sizeBoxVerical(height*.05),
                    defaultTextFormField(
                      controller: emailController,
                      keboardType: TextInputType.emailAddress,
                      validate: (String value){
                        if(value.isEmpty)
                          return "email must not to be empty";
                      },
                      label: "Email",
                      prefix:  Icons.email,
                      prefixcolor: General.kSecondaryColor,
                    ),

                    General.sizeBoxVerical(20.0),
                    defaultTextFormField(
                      controller: passwordController,
                      keboardType: TextInputType.visiblePassword,
                      isPassword: ShopRegisterCubit.get(context).isPassword,
                      label: "Enter Password",
                      prefix:  Icons.lock,
                      prefixcolor: General.kSecondaryColor,
                      suffix: ShopRegisterCubit.get(context).suffix,
                      suffixPressed: (){
                        ShopRegisterCubit.get(context).changePasswordVisibility();
                      },
                      validate: (String value){
                        if(value.isEmpty)
                          return "password must not to be empty";
                      },
                    ),

                    General.sizeBoxVerical(height*.05),
                    defaultTextFormField(
                      controller: phoneController,
                      keboardType: TextInputType.phone,
                      validate: (String value){
                        if(value.isEmpty)
                          return "phone number must not to be empty";
                      },
                      label: "Phone Number",
                      prefix:  Icons.phone,
                      prefixcolor: General.kSecondaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: ConditionalBuilder(
          condition: state is! ShopRegisterLoadingState,
          builder: (context)=>CustomGeneralButton(text:"REGISTER",
            backgroungColor: General.kSecondaryColor,
            width: width,
            onTap: (){
              if(formKey.currentState.validate()){
                ShopRegisterCubit.get(context).userRegister(
                  name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  },
),
);


    /*return ConditionalBuilder(
      condition: AppCubit.get(context).userModel !=null,
      builder: (context)=>Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child:Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultTextFormField(
                controller: nameController,
                keboardType: TextInputType.name,
                validate: (String value){
                  if(value.isEmpty)
                    return "name must not to be empty";
                },
                label: "User Name",
                prefix:  Icons.person,
                prefixcolor: General.kSecondaryColor,
              ),

              General.sizeBoxVerical(height*.05),
              defaultTextFormField(
                controller: emailController,
                keboardType: TextInputType.emailAddress,
                validate: (String value){
                  if(value.isEmpty)
                    return "email must not to be empty";
                },
                label: "Email",
                prefix:  Icons.email,
                prefixcolor: General.kSecondaryColor,
              ),

              General.sizeBoxVerical(20.0),
              defaultTextFormField(
                controller: passwordController,
                keboardType: TextInputType.visiblePassword,
                isPassword: ShopRegisterCubit.get(context).isPassword,
                label: "Enter Password",
                prefix:  Icons.lock,
                prefixcolor: General.kSecondaryColor,
                suffix: ShopRegisterCubit.get(context).suffix,
                suffixPressed: (){
                  ShopRegisterCubit.get(context).changePasswordVisibility();
                },
                validate: (String value){
                  if(value.isEmpty)
                    return "password must not to be empty";
                },
              ),

              General.sizeBoxVerical(height*.05),
              defaultTextFormField(
                controller: phoneController,
                keboardType: TextInputType.phone,
                validate: (String value){
                  if(value.isEmpty)
                    return "phone number must not to be empty";
                },
                label: "Phone Number",
                prefix:  Icons.phone,
                prefixcolor: General.kSecondaryColor,
              ),

              // General.sizeBoxVerical(30.0),
              Spacer(),
              ConditionalBuilder(
                // condition: state is! ShopLoginLoadingState,
                condition: true,
                builder: (context)=>CustomGeneralButton(text:"REGISTER",
                  backgroungColor: General.kSecondaryColor,
                  width: width,
                  onTap: (){
                    if(formKey.currentState.validate()){
                      ShopRegisterCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),


            ],
          ),
        ),
      ),
      fallback: (context)=>Center(child: CircularProgressIndicator()),
    );*/
  }
}