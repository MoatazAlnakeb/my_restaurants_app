import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/layout/home/widgets/home_page_builder.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){},
    builder: (context,state){
      return ConditionalBuilder(
          // condition: state is ! ShopLoadingHomeDataState,
          condition: AppCubit.get(context).homeModel != null&&AppCubit.get(context).categoriesModel != null,
          builder:(context)=>homePageBuilderWidget(AppCubit.get(context).homeModel,AppCubit.get(context).categoriesModel,context),
        fallback: (context)=>Center(child: CircularProgressIndicator()),
      );
    },
    );
  }
}
