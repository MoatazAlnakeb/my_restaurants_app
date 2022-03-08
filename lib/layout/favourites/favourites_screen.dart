
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/layout/favourites/widgets/build_favourite_item.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return
          AppCubit.get(context).favouritesModel != null
          ?ListView.separated(
              itemBuilder: (context, index) => buildFavItem(AppCubit.get(context).favouritesModel!.data!.data![index].product!),
              separatorBuilder: (context, index) => SizedBox(width: 10,),
              itemCount: AppCubit.get(context).favouritesModel!.data!.data!.length
          )
        :Center(child: CircularProgressIndicator());

        //   ConditionalBuilder(
        //   // condition: state is !ShopLoadingGetFavouritesState,
        //     condition: AppCubit.get(context).favouritesModel != null,
        //   builder: (context)=>ListView.separated(
        //       itemBuilder: (context, index) => buildFavItem(AppCubit.get(context).favouritesModel.data!.data![index].product!),
        //       separatorBuilder: (context, index) => SizedBox(width: 10,),
        //       itemCount: AppCubit.get(context).favouritesModel.data!.data!.length
        //   ),
        //   fallback:(context)=>Center(child: CircularProgressIndicator())
        // );
      },
    );
  }
}

// return ConditionalBuilder(
// condition: AppCubit.get(context).categoriesModel != null,
// builder: (context)=>ListView.separated(
// itemBuilder: (context, index) => buildCatItem(AppCubit.get(context).categoriesModel.data.data[index]),
// separatorBuilder: (context, index) => SizedBox(width: 10,),
// itemCount: AppCubit.get(context).categoriesModel.data.data.length
// ),
// fallback: (context)=>Center(child: CircularProgressIndicator()),
// );
