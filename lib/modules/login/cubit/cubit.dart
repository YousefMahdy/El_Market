import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/modules/login/cubit/states.dart';
import 'package:jooo/shared/network/end_points.dart';
import 'package:jooo/shared/network/remote/dio_Helper.dart';

import '../../../models/loginModel.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState()) {
}
   static ShopLoginCubit get (context){
     return BlocProvider.of(context);
   }
    bool isPasswod=true;
   void changePasswordVisability(isPasswor){
     isPasswod=!isPasswor;
     emit(ShopLoginChangePasswordVisabilityState());
   }
    ShopLoginModel? loginModel;
   void userLogin({
    required email,
     required password,
}){
     emit(ShopLoginLoadingState());
     DioHelper.postData(

         path: LOGIN,
         data: {
           'email':email,
           'password':password
         }
         ).then((value) {
      // print (value.data);
           loginModel=ShopLoginModel.fromJson(value.data);
           print (loginModel!.message);


           emit(ShopLoginSuccessState(loginModel!));

     }).catchError((error){
       print (loginModel!.message);
       emit(ShopLoginErrorState(error.toString()));

       print (error.toString());
     });
   }
}