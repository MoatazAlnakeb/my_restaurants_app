import 'package:flutter/material.dart';
import 'package:my_restaurant_app/layout/models/categories_model.dart';

Widget buildCatItem(Datum model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Image(image: NetworkImage(model.image,),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      SizedBox(width: 20,),
      Text(model.name,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
      Spacer(),
      Icon(Icons.arrow_forward_ios)
    ],
  ),
);

