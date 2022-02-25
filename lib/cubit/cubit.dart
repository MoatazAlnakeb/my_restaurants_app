import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_restaurant_app/authentication/models/login_model.dart';
import 'package:my_restaurant_app/cubit/states.dart';
import 'package:my_restaurant_app/layout/category/category_screen.dart';
import 'package:my_restaurant_app/layout/favourites/favourites_screen.dart';
import 'package:my_restaurant_app/layout/home/home_screen.dart';
import 'package:my_restaurant_app/layout/models/categories_model.dart';
import 'package:my_restaurant_app/layout/models/change_favourites_model.dart';
import 'package:my_restaurant_app/layout/models/favourite_items_model.dart';
import 'package:my_restaurant_app/layout/models/home_model.dart';
import 'package:my_restaurant_app/layout/profile/profile_details_screen.dart';
import 'package:my_restaurant_app/network/end_points.dart';
import 'package:my_restaurant_app/network/local/cach_helper.dart';
import 'package:my_restaurant_app/network/remote/dio_helper.dart';
import 'package:my_restaurant_app/shared/constants.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());
  static AppCubit get (context) => BlocProvider.of(context);

  List<String> titles = [
    "Home Page",
    "Category",
    "Favourites",
    "Profile",
  ];

  bool isDark = false;

  void changeAppTheme({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    }
    else {
      isDark = !isDark;
      CashHelper.putIsAppThemeDark(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeModeState());
      });
    }
  }


  int currentIndex = 0;
  List<Widget>bottomScreens = [
    HomePageScreen(),
    CategotyScreen(),
    // ShoppingCartScreen(),
    FavouritesScreen(),
    ProfileDetailsScreen(),
  ];
  void changeBottomNavBarIndex(int index){
    currentIndex = index;
    emit(ShopChangeBottomNavBarState());
  }


////////////////////////
  HomeModel homeModel;

  Map<int,bool>favourites ={};
  void getHomeData(){
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel.data.products.forEach((element) {
        favourites.addAll({
          element.id : element.inFavorites
        }
        );
      });
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }


  ///////////
  CategoriesModel categoriesModel;

  void getCategories(){
    DioHelper.getData(url: Get_CATEGORIES,token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  //////////
   ChangeFavouritesModel changeFavouritesModel;

   void changeFavourites(int productId){
  favourites[productId] = !favourites[productId];
  emit(ShopChangeFavouritesState());

  DioHelper.postData(
        url: FAVOURITES,
        data: {
          'product_id':productId
        },
      token: token
    ).then((value)
    {
      changeFavouritesModel = ChangeFavouritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavouritesModel.status)
        favourites[productId] = !favourites[productId];
      else
        getFavourites();
      emit(ShopSuccessChangeFavouritesState(changeFavouritesModel));
    }).catchError((error){
    favourites[productId] = !favourites[productId];
      emit(ShopErrorChangeFavouritesState());
    });
}

/////////////
  FavouritesModel favouritesModel;

  void getFavourites(){
    emit(ShopLoadingGetFavouritesState());
    DioHelper.getData(
        url: FAVOURITES,
        token: token
    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavouritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavouritesState());
    });
  }

  ShopLoginModel userModel;

  void getUserData(){
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
        url: PROFILE,
        token: token
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);
      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }


  void updateUserData({
  @required String name,
  @required String phone,
  @required String email,
}){
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
      data: {
          'name':name,
          'phone':phone,
          'email':email,
      }
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);
      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

}
