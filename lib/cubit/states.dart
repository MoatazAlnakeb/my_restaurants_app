
import 'package:my_restaurant_app/authentication/models/login_model.dart';
import 'package:my_restaurant_app/layout/models/change_favourites_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeThemeModeState extends AppStates {}

class ShopChangeBottomNavBarState extends AppStates {}



class ShopLoadingHomeDataState extends AppStates {}

class ShopSuccessHomeDataState extends AppStates {}

class ShopErrorHomeDataState extends AppStates {}

class ShopSuccessCategoriesState extends AppStates {}

class ShopErrorCategoriesState extends AppStates {}

class ShopChangeFavouritesState extends AppStates {}

class ShopSuccessChangeFavouritesState extends AppStates {
  final ChangeFavouritesModel model;

  ShopSuccessChangeFavouritesState(this.model);

}

class ShopErrorChangeFavouritesState extends AppStates {}


class ShopSuccessGetFavouritesState extends AppStates {}

class ShopLoadingGetFavouritesState extends AppStates {}

class ShopErrorGetFavouritesState extends AppStates {}

class ShopSuccessUserDataState extends AppStates {
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopLoadingUserDataState extends AppStates {}

class ShopErrorUserDataState extends AppStates {}


class ShopSuccessUpdateUserState extends AppStates {
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopLoadingUpdateUserState extends AppStates {}

class ShopErrorUpdateUserState extends AppStates {}
