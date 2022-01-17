import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/modules/counter_app/counter/cubit/states.dart';


class CounterCubit extends Cubit<CounterStetes> {
  CounterCubit() : super(CounterInitialState());



  static CounterCubit get(context) => BlocProvider.of(context);

  int conter1 =25;
  void minus (){
    conter1--;
    emit(CounterMinusState(conter1));
  }
  void pluse (){
    conter1++;
    emit(CounterPlusState(conter1));
   //           const int  v=   5 ;
  }
}
