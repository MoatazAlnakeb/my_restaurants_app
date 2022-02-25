import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/shared/constants.dart';
import 'package:my_restaurant_app/shared/widgets/custom_button.dart';
import 'package:my_restaurant_app/shared/widgets/custom_test_field.dart';

Widget buildProfileBody() {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  return BlocConsumer<AppCubit,AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      var model = AppCubit.get(context).userModel;
      nameController.text = model.data.name;
      emailController.text = model.data.email;
      phoneController.text = model.data.phone;
      return ConditionalBuilder(
        // condition: state is ! ShopLoadingHomeDataState,
          condition: AppCubit.get(context).userModel !=null,
          builder: (context)=>Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if(state is ShopLoadingUpdateUserState)
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 20),
                      child: LinearProgressIndicator(),
                    ),
                  defaultTextFormField(
                      controller: nameController,
                      keboardType: TextInputType.name,
                      validate: (String value) {
                        if (value.isEmpty)
                          return 'name must not be empty';
                        return null;
                      },
                      label: 'Name',
                      prefix: Icons.person),
                  SizedBox(height: 20,),

                  defaultTextFormField(
                      controller: phoneController,
                      keboardType: TextInputType.phone,
                      validate: (String value) {
                        if (value.isEmpty)
                          return 'phone must not be empty';
                        return null;
                      },
                      label: 'Phone Number',
                      prefix: Icons.phone),
                  SizedBox(height: 20,),

                  defaultTextFormField(
                      controller: emailController,
                      keboardType: TextInputType.emailAddress,
                      validate: (String value) {
                        if (value.isEmpty)
                          return 'email must not be empty';
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email),
                  SizedBox(height: 20,),
                  Spacer(),
                  Column(
                    children: [
                      CustomGeneralButton(text:"UPDATE",
                          backgroungColor: General.kSecondaryColor,
                          width: double.infinity,
                          onTap: () {
                        if(formKey.currentState.validate()){
                          AppCubit.get(context).updateUserData(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text
                          );
                        }
                          }
                      ),
                      SizedBox(height: 20,),
                      CustomGeneralButton(text:"LOGOUT",
                          backgroungColor: General.kSecondaryColor,
                          width: double.infinity,
                          onTap: () {signOut(context);}
                      ),

                    ],
                  ),
                ],),
            ),
          ),
        fallback: (context)=>Center(child: CircularProgressIndicator()),
      );
    },
  );
}