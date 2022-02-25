import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/layout/favourites/widgets/build_favourite_item.dart';
import 'package:my_restaurant_app/layout/search/cubit/cubit.dart';
import 'package:my_restaurant_app/layout/search/cubit/status.dart';
import 'package:my_restaurant_app/layout/search/widgets/build_search_item.dart';
import 'package:my_restaurant_app/shared/widgets/custom_test_field.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  defaultTextFormField(
                      controller: searchController,
                      keboardType: TextInputType.text,
                      validate: (String value){
                        if(value.isEmpty)
                          return 'enter text to search';
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    onSubmit: (String text){
                        SearchCubit.get(context).search(text);
                    }
                  ),

                  SizedBox(height: 10,),
                  if(state is SearchLoadingState)
                    LinearProgressIndicator(),

                  SizedBox(height: 10,),

                  if(state is SearchSuccessState)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => buildSearchItem(SearchCubit.get(context).searchmodel.data.data[index]),
                        separatorBuilder: (context, index) => SizedBox(width: 10,),
                        itemCount: SearchCubit.get(context).searchmodel.data.data.length
                    ),
                  ),
                ],),
              ),
            )
          );
        },
      ),
    );
  }
}
