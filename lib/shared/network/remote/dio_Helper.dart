

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../components/constants.dart';

class DioHelper{
  static late  Dio dio  ;

  static init () {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        // headers: {     //لانه اوقات بيلغى اللى تحت  :)
        //  "Content-Type" :"application/json"
        // },
         receiveDataWhenStatusError: true

    ));
  }
    static Future < Response<dynamic>>getData({
     required String path,
        Map<String,dynamic>?query,

      String lang='en',

    }) async {
      dio.options.headers={
            "lang":lang,
      "Content-Type" :"application/json",
            "Authorization":token

          };
     return await dio.get(path,queryParameters: query);

    }
  static Future < Response<dynamic>>postData({
    required String path,
      Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='en',

  }) async {
    dio.options.headers={
        "lang":lang,
        "Authorization":token,
      "Content-Type" :"application/json"
      };

    return await dio.post(path,queryParameters: query,data: data);
}
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
   // String ?token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
   // void getHttp() async {
   //   try {
   //     var response = await Dio().get('http://www.google.com');
   //     print(response);
   //   } catch (e) {
   //     print(e);
   //   }
   // }
}