

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:jooo/layout/news_App/cubit/cubit.dart';
import 'package:jooo/layout/news_App/cubit/states.dart';
import 'package:jooo/modules/news_app/search_screen/searchsScreen.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/cubit/cubit.dart';
import 'package:jooo/shared/network/remote/dio_Helper.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStetes>(
      listener: (context,state){},
      builder:(context,state){
        NewsCubit cubit =NewsCubit.get(context);
       // NewsCubit cubit=BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("news Screen",),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context,SearchScreen());
                  },
                  icon:  Icon(
                    Icons.search_outlined

                  )),
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changDarkMode(!AppCubit.get(context).isDark);
                    },
                  icon:  Icon(
                      Icons.brightness_4_outlined

                  ))
            ],
          ),

          body:cubit.screens[cubit.current_index],

          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navBarItem,
            // backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,

            elevation: 15,
             selectedItemColor: Colors.deepOrange,


             currentIndex: cubit.current_index,
            onTap: (index){
             cubit.changIndex(index);
            },

          )
        );
      } ,

    );
  }
}
