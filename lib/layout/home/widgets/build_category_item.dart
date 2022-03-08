import 'package:flutter/material.dart';
import 'package:my_restaurant_app/layout/models/categories_model.dart';

Widget buildCategoryItemWidget(Datum model,context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image!),
        height: height*.2,
        width: width*.3,
        fit: BoxFit.cover,
      ),
      Container(
          color: Colors.black.withOpacity(.8),
          width: width*.3,
          // width: 100,
          child: Text(model.name!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          )),
    ],
  );
}
