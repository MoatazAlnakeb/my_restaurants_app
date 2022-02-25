import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/layout/models/search_model.dart';
import 'package:my_restaurant_app/layout/search/cubit/status.dart';
import 'package:my_restaurant_app/network/end_points.dart';
import 'package:my_restaurant_app/network/remote/dio_helper.dart';
import 'package:my_restaurant_app/shared/constants.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get (context) => BlocProvider.of(context);

  SearchModel searchmodel;

  void search(String text){
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        data: {
          'text':text,
          'token':token,
        }
    ).then((value) {
      searchmodel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState());
    });
  }

}