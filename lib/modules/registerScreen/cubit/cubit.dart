import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/modules/registerScreen/cubit/states.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_Helper.dart';
import '../../../models/loginModel.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

   ShopLoginModel? loginModel;

  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  async {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
      path: REGISTER,
      data:
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopRegisterChangePasswordVisibilityState());
  }
}
