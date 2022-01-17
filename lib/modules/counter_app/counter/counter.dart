import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class Counter extends StatefulWidget {
 //// const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  ////var count=22;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => CounterCubit(),


      child: BlocConsumer<CounterCubit,CounterStetes>(
        listener: (context,state){
          if(state is CounterPlusState){
            print("plsee State ${state.counter}");
          }
          if(state is CounterMinusState){
            print("minuse State ${state.counter}");
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("counter"),

            ),
            body: Center(
              child: Container(
                ////color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      //radius: 20,
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            CounterCubit.get(context).pluse();

                          },
                          icon: Icon(
                            Icons.add,

                            // Icons.arrow_right_alt_outlined
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20
                      ),
                      child: Text("${CounterCubit.get(context).conter1}",style: TextStyle(fontSize:30,fontWeight: FontWeight.w900),),
                    ),
                    Container(
                      width:40 ,
                      height: 40,
                      padding: EdgeInsetsDirectional.only(
                        bottom: 0,
                      ),


                      child: TextButton(
                          onPressed: (){
                         CounterCubit.get(context).minus();
                          },

                          child: Text("-",style: TextStyle(fontSize:25,fontWeight: FontWeight.w900,color: Colors.white),)),
                      decoration: BoxDecoration(
                        color: Colors.blue,

                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
