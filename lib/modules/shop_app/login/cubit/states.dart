import 'package:jooo/models/shopAppmodel/loginModel.dart';

abstract class ShopLoginStates {}
class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error){
    print ("Loginerror $error ");
  }
}

class ShopLoginChangePasswordVisabilityState extends ShopLoginStates{}

