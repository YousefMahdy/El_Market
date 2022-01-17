import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/layout/shopLayout/cubit/states.dart';
import 'package:jooo/models/shopAppmodel/categories_model.dart';
import 'package:jooo/models/shopAppmodel/favorites_model.dart';
import 'package:jooo/modules/shop_app/categotiesScreen/categoriesScreen.dart';
import 'package:jooo/modules/shop_app/productsScreen/shopProducts.dart';
import 'package:jooo/modules/shop_app/setings/settingsScreen.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/network/end_points.dart';
import 'package:jooo/shared/network/remote/dio_Helper.dart';
import '../../../models/shopAppmodel/change_favorites_model.dart';
import '../../../models/shopAppmodel/homeModel.dart';
import '../../../models/shopAppmodel/loginModel.dart';
import '../../../modules/shop_app/favoritsScreen/FavoritsScreen.dart';
import '../../../shared/components/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(InitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int current_index = 0;

  List<Widget> screens = [
    ShopProducts(),
    CategoriesScreen(),
    FavoritsScreen(),
    SettingsScreen()
  ];

  changIndex(index) {
    current_index = index;
    emit(ChangeBottomNaveState());
  }


  HomeModel? homeModel;
  Map<int,bool> favorites={};

  Future getHomeData() async {
    await DioHelper.getData(path: HOME).then((value) {
      print(value.data.toString());
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll( {element.id :element.inFavorites});

      });
      print(favorites.toString());
      // print("xxxxx");
      //print(homeModel!.data!.banners[0].image);
      emit(ShopSuccessHomeDataState(homeModel!));
    }).catchError((e) {
      print(e);
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  Future geCategoriesData() async {
    await DioHelper.getData(path: CATEGORIES).then((value) {
     // print(value.data.toString());
      categoriesModel = CategoriesModel.fromJson(value.data);
      // print("xxxxx");
     // print(categoriesModel?.data!.data[0].name.toString());
      emit(ShopSuccessCategoriesState(categoriesModel!));
    }).catchError((e) {
      print(e);
      emit(ShopErrorHomeDataState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void addOrDeleteFavorits( {

    required int product_id,
  }) {
    favorites[product_id] = !favorites[product_id]!;

    emit(ShopFavoritesState());

    DioHelper.postData(

        path: FAVORITES,
        data: {
          'product_id': product_id,

        }).then((value) {
     // printFullMessage(value.data.toString());
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
     // print(value.data);

      if (!changeFavoritesModel!.status) {
        favorites[product_id] = !favorites[product_id]!;
      } else {
        getFavoritesData();
      }

      emit(ShopSuccessFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      //   print (loginModel.message);
      favorites[product_id] = !favorites[product_id]!;
      emit(ShopErrorFavoritesState());

      print(error.toString());
    });
  }

  FavoritesModel? favoritesModel;

  Future getFavoritesData() async {
    await DioHelper.getData(path: FAVORITES).then((value) {
     // print("goooooo111");

      //print(favoritesModel!.data!.data.length);
      favoritesModel = FavoritesModel.fromJson(value.data);
      // print(value.data);
      // print("goooooo");
      // print(favoritesModel!.data!.data[1].product!.id);
      // print(favoritesModel!.data!.data.length);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((e) {
      print(e);
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel ?userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      path:  PROFILE,

    ).then((value) {
      print("userModel!.data!.name");
      print(value.data);
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);
      print(userModel!.data!.email);
      print(userModel!.data!.phone);

      emit(ShopSuccessUserDataState(userModel!));

    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,

      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      print("userModel!.data!.name");
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);
      print(userModel!.data!.email);
      print(userModel!.data!.phone);
      print("userModel!.data!.name");
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

}