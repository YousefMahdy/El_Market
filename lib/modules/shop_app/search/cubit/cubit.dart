import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/modules/shop_app/search/cubit/states.dart';

import '../../../../models/shopAppmodel/search_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_Helper.dart';


class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      path: SEARCH,

      data: {
        'text': text,
      },
    ).then((value)
    {
      model = SearchModel.fromJson(value.data);
      print(value.data.toString()+"jooooo");

      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
