
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/cubit/cubit.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/layout/notification/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Notifications"),
          ),
          body:
          AppCubit.get(context).notificationModel != null
          ?ListView.separated(
              physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildNotificationItem(AppCubit.get(context).notificationModel!.data!.data![index],context),
        separatorBuilder: (context, index) => Container(color: Colors.grey,height: 1,),
        itemCount: AppCubit.get(context).notificationModel!.data!.data!.length
        )
            :Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
