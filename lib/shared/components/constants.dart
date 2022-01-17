

import 'package:jooo/modules/shop_app/login/shop_logIn.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/network/local/cashe_helper.dart';

void printFullMessage(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


 logOut(context){

  CasheHelper.removeData(key: 'token').then((value) {
    if(value){
      print('token isDeleted');
      navigatePushAndRemove(context, ShopLogin());
  }
  }).catchError((e){});

  }


String token='';







