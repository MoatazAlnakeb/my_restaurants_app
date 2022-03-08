import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/models/home_model.dart';
import 'package:my_restaurant_app/shared/widgets/show_toast.dart';

Widget buildGridProduct(Product productmodel,context){
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(productmodel.image!),
              width: double.infinity,
              height: 200,
              // fit: BoxFit.cover,
            ),
            if(productmodel.discount!=0)
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
      Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productmodel.name!,
            maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.33
              ),
            ),
            Row(
              children: [
                Text(
                  '${productmodel.price!.round()}',
                  style: TextStyle(
                    color: General.kSecondaryColor,
                      fontSize: 12,
                  ),
                ),
                SizedBox(width: 5,),
                if(productmodel.discount!=0)
                Text(
                  '${productmodel.oldPrice!.round()}',
                  // softWrap: true,
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
                      if(!state.model.status!)
                        showToast(text: state.model.message!, state: ToastState.ERROR);
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                      onPressed: (){
                    AppCubit.get(context).changeFavourites(productmodel.id!);},
                    icon: CircleAvatar(
                      radius: 15,//Colors.grey
                      backgroundColor: AppCubit.get(context).favourites[productmodel.id]!
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
          ],
        ),
      ),
    ],),
  );
}