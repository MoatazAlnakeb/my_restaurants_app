import 'package:flutter/material.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
import 'package:my_restaurant_app/layout/models/categories_model.dart';
import 'package:my_restaurant_app/layout/models/notification_model.dart';

Widget buildNotificationItem(NotificationDatum model,context)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        width: 60,
        height: 60,
        child: CircleAvatar(
          backgroundColor: General.kSecondaryColor,
            child: IconButton(
                icon: Icon(Icons.notification_important,
                size: 35,),
                color: Colors.white, onPressed:(){})
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            model.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
            SizedBox(height: 10,),
          Text(
            model.message!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black38,
                height: 1.33,
              // fontSize: 14
            )
          )
        ],),
      )

    ],
  ),
);

