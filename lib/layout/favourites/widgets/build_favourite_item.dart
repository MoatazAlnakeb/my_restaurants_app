import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/models/favourite_items_model.dart';
import 'package:my_restaurant_app/shared/widgets/show_toast.dart';

Widget buildFavItem(Product model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              height: 100,
              width: 100,
              // fit: BoxFit.cover,
            ),
            if(model.discount !=0)
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: 20,),
        // Spacer(),
        // Icon(Icons.arrow_forward_ios)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "All-New Kindle Oasis (10th gen) - 7 Inch High-Resolution Display, Waterproof, 8 GB, Wi-Fi, Graphite",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  height: 1.33
              ),
            ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: TextStyle(
                      color: General.kSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5,),
                  if(model.discount!=0)
                    Text(
                      '${model.oldPrice.round()}',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                  Spacer(),
                  BlocConsumer<AppCubit,AppStates>(
                    listener: (context, state) {
                      if(state is ShopSuccessChangeFavouritesState){
                        if(!state.model.status)
                          showToast(text: state.model.message, state: ToastState.ERROR);
                      }
                    },
                    builder: (context, state) {
                      return IconButton(
                        onPressed: (){
                          AppCubit.get(context).changeFavourites(model.id);},
                        icon: CircleAvatar(
                          radius: 15,//Colors.grey
                          backgroundColor: AppCubit.get(context).favourites[model.id]
                              ? General.kSecondaryColor
                              : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
          ],),
        )
      ],
    ),
  ),
);
