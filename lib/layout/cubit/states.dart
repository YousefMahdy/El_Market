import 'package:jooo/models/change_favorites_model.dart';

import '../../models/categories_model.dart';
import '../../models/homeModel.dart';
import '../../models/loginModel.dart';


abstract class ShopStates {}
class InitialState extends ShopStates{}
class ChangeBottomNaveState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{
  HomeModel homeModel;
  ShopSuccessHomeDataState(this.homeModel);
}
class ShopErrorHomeDataState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{
  CategoriesModel categoriesModel;
  ShopSuccessCategoriesState(this.categoriesModel);
}
class ShopErrorCategoriesState extends ShopStates{}
class ShopFavoritesState extends ShopStates{}
class ShopSuccessFavoritesState extends ShopStates{
  ChangeFavoritesModel changeFavoritesModel;
  ShopSuccessFavoritesState(this.changeFavoritesModel);
}
class ShopErrorFavoritesState extends ShopStates{}
class ShopSuccessGetFavoritesState extends ShopStates{}
class ShopErrorGetFavoritesState extends ShopStates{}


class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}